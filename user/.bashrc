[[ $- != *i* ]] && return

set +u
set +o nounset

if [[ -f ~/.local/share/blesh/ble.sh ]]; then
  source ~/.local/share/blesh/ble.sh --noattach
fi

export BASH_IT="$HOME/.bash_it"

export BASH_IT_THEME='clean'
export THEME_CHECK_SUDO='true'

export SCM_CHECK=true
export BASH_IT_COMMAND_DURATION=true
export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

export SCM_GIT_GITSTATUS_DIR="$HOME/gitstatus"
export GITSTATUS_NUM_THREADS=8

if [[ -f "$BASH_IT/bash_it.sh" ]]; then
  source "$BASH_IT/bash_it.sh"
fi

if [[ -d /usr/share/fzf ]]; then
  source /usr/share/fzf/key-bindings.bash
  source /usr/share/fzf/completion.bash
fi

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init bash)"
fi

shopt -s nocaseglob
shopt -s cdspell
bind "set completion-ignore-case on"

alias update='sudo pacman -Syu'
alias yay='paru'
alias vim='nvim'
alias ls='eza --icons --grid'
alias ll='eza --icons --long --all --group-directories-first --git'
alias lt='eza --icons --tree --level=1 --all --ignore-glob=".git|node_modules"'
alias ..='cd ..'
alias grep='grep --color=auto'
alias battery-on='echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'
alias battery-off='echo 0 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'
alias battery-status='sudo tlp-stat -b'

if [[ ${BLE_VERSION-} ]] && [[ "$TERM_PROGRAM" != "vscode" ]] && [[ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]]; then
  ble-attach
fi

if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  . "$(code --locate-shell-integration-path bash)"

fi
