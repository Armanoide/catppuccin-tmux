#!/usr/bin/env bash
#
# Extract GPU usage percentage from macOS powermetrics.
# Requires: sudo access to powermetrics (configure in /etc/sudoers.d/)
#
# Usage: run from tmux status line as #(path/to/gpu_percentage.sh)
# Output: a number like "1.63" or "0" if unavailable

GPU_ACTIVE=$(sudo powermetrics --samplers gpu_power -n 1 -i 1000 2>/dev/null \
  | grep "GPU HW active residency:" | head -1 \
  | awk '{print $5}' | sed 's/%//')

if [[ -z "$GPU_ACTIVE" || "$GPU_ACTIVE" == "%" ]]; then
  echo "0"
else
  echo "$GPU_ACTIVE"
fi
