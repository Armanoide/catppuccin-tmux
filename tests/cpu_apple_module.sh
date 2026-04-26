#!/usr/bin/env bash

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
# shellcheck disable=SC1091
source "${script_dir}/helpers.sh"

# Tests the Apple Silicon CPU module (native macOS via top)
tmux source "${script_dir}/../catppuccin_options_tmux.conf"
tmux set -g @catppuccin_cpu_source "apple"
tmux source "${script_dir}/../catppuccin_tmux.conf"

print_option E:@catppuccin_status_cpu
