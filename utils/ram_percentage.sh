#!/usr/bin/env bash
#
# Extract system RAM usage percentage from macOS memory_pressure.
# No special privileges required.
#
# Usage: run from tmux status line as #(path/to/ram_percentage.sh)
# Output: a number like "67.4" (RAM usage percentage)

RAM_PERCENT=$(memory_pressure 2>/dev/null \
  | grep "System-wide memory free percentage" \
  | awk '{print $NF}' | sed 's/%//')

if [[ -z "$RAM_PERCENT" ]]; then
  echo "0"
else
  RAM_USAGE=$(awk "BEGIN {printf \"%.1f\", 100 - $RAM_PERCENT}")
  echo "$RAM_USAGE"
fi
