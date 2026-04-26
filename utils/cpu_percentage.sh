#!/usr/bin/env bash
#
# Extract CPU usage percentage from macOS top command.
# No special privileges required.
#
# Usage: run from tmux status line as #(path/to/cpu_percentage.sh)
# Output: a number like "12.3" (CPU usage percentage)

CPU_IDLE=$(top -l 1 -n 0 2>/dev/null \
  | grep -E "CPU usage:" | head -1 \
  | awk '{print $3}' | sed 's/%//')

if [[ -z "$CPU_IDLE" ]]; then
  echo "0"
else
  CPU_USAGE=$(awk "BEGIN {printf \"%.1f\", 100 - $CPU_IDLE}")
  echo "$CPU_USAGE"
fi
