#!/usr/bin/env bash

# Set path of script
PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set absolute path for use in status configs
tmux set-option -g @catppuccin_plugin_dir "${PLUGIN_DIR}"

# Export env var for use in shell commands inside #()
tmux set-environment -g CATPPUCCIN_PLUGIN_DIR "${PLUGIN_DIR}"

tmux source "${PLUGIN_DIR}/catppuccin_options_tmux.conf"
tmux source "${PLUGIN_DIR}/catppuccin_tmux.conf"
