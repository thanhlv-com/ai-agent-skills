#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_CONFIG_FILE="${PROJECT_ROOT}/config.toml"
CODEX_HOME="${HOME}/.codex"
LOCAL_CONFIG_FILE="${CODEX_HOME}/config.toml"
SYNC_SKILLS_SCRIPT="${PROJECT_ROOT}/scripts/sync-skills.sh"

if [[ ! -x "${SYNC_SKILLS_SCRIPT}" && ! -f "${SYNC_SKILLS_SCRIPT}" ]]; then
  echo "Missing sync script: ${SYNC_SKILLS_SCRIPT}"
  exit 1
fi

if [[ ! -f "${PROJECT_CONFIG_FILE}" ]]; then
  echo "Missing project config: ${PROJECT_CONFIG_FILE}"
  exit 1
fi

bash "${SYNC_SKILLS_SCRIPT}"

mkdir -p "${CODEX_HOME}"

if [[ ! -f "${LOCAL_CONFIG_FILE}" ]]; then
  cp "${PROJECT_CONFIG_FILE}" "${LOCAL_CONFIG_FILE}"
  echo "Created ${LOCAL_CONFIG_FILE} from project config."
  exit 0
fi

tmp_file="$(mktemp)"
backup_file="${LOCAL_CONFIG_FILE}.bak.$(date +%Y%m%d%H%M%S)"

python3 - "${PROJECT_CONFIG_FILE}" "${LOCAL_CONFIG_FILE}" "${tmp_file}" <<'PY'
import re
import sys
import tomllib
from pathlib import Path

source_path = Path(sys.argv[1])
local_path = Path(sys.argv[2])
out_path = Path(sys.argv[3])

source_data = tomllib.loads(source_path.read_text(encoding="utf-8"))
local_data = tomllib.loads(local_path.read_text(encoding="utf-8"))

BARE_KEY = re.compile(r"^[A-Za-z0-9_-]+$")


def deep_copy(value):
    if isinstance(value, dict):
        return {k: deep_copy(v) for k, v in value.items()}
    if isinstance(value, list):
        return [deep_copy(v) for v in value]
    return value


def merge(local_value, source_value):
    if isinstance(local_value, dict) and isinstance(source_value, dict):
        merged = {k: deep_copy(v) for k, v in local_value.items()}
        for key, source_item in source_value.items():
            if key in merged:
                merged[key] = merge(merged[key], source_item)
            else:
                merged[key] = deep_copy(source_item)
        return merged
    return deep_copy(source_value)


def format_key(key):
    if BARE_KEY.match(key):
        return key
    escaped = key.replace("\\", "\\\\").replace('"', '\\"')
    return f'"{escaped}"'


def format_string(value):
    escaped = value.replace("\\", "\\\\").replace('"', '\\"').replace("\n", "\\n")
    return f'"{escaped}"'


def format_value(value):
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, int):
        return str(value)
    if isinstance(value, float):
        return repr(value)
    if isinstance(value, str):
        return format_string(value)
    if isinstance(value, list):
        return "[" + ", ".join(format_value(item) for item in value) + "]"
    raise TypeError(f"Unsupported value type: {type(value)!r}")


def is_table(value):
    return isinstance(value, dict)


def emit_table(path_parts, table_data, lines):
    scalar_items = [(k, v) for k, v in table_data.items() if not is_table(v)]
    table_items = [(k, v) for k, v in table_data.items() if is_table(v)]

    if path_parts:
        lines.append("[" + ".".join(path_parts) + "]")

    for key, value in scalar_items:
        lines.append(f"{format_key(key)} = {format_value(value)}")

    if scalar_items and table_items:
        lines.append("")

    for idx, (key, subtable) in enumerate(table_items):
        child_path = path_parts + [format_key(key)]
        emit_table(child_path, subtable, lines)
        if idx < len(table_items) - 1:
            lines.append("")


def dump_toml(data):
    if not isinstance(data, dict):
        raise TypeError("TOML root must be a table")

    lines = []
    root_scalars = [(k, v) for k, v in data.items() if not is_table(v)]
    root_tables = [(k, v) for k, v in data.items() if is_table(v)]

    for key, value in root_scalars:
        lines.append(f"{format_key(key)} = {format_value(value)}")

    if root_scalars and root_tables:
        lines.append("")

    for idx, (key, table_data) in enumerate(root_tables):
        emit_table([format_key(key)], table_data, lines)
        if idx < len(root_tables) - 1:
            lines.append("")

    return "\n".join(lines) + "\n"


merged = merge(local_data, source_data)
out_path.write_text(dump_toml(merged), encoding="utf-8")
PY

cp "${LOCAL_CONFIG_FILE}" "${backup_file}"
mv "${tmp_file}" "${LOCAL_CONFIG_FILE}"
echo "Merged ${PROJECT_CONFIG_FILE} into ${LOCAL_CONFIG_FILE}."
echo "Backup saved: ${backup_file}"
