#!/usr/bin/env bash

set -e

command_exists() {
  command -v "$@" >/dev/null 2>&1
}
command_or_bust() {
  command_exists "$@" || {
    echo "Command $@ not found. I must speak to a manager."
    exit 1 
  }
}

command_or_bust zsh

if [[ ! -d "${ZSH:-$HOME/.oh-my-zsh}" ]]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  installed_omz="yep"
fi

autosuggest_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
if [[ ! -d "$autosuggest_dir" ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$autosuggest_dir"
fi 

syntax_hl_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
if [[ ! -d "$syntax_hl_dir" ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$syntax_hl_dir" 
fi

substr_search_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-history-substring-search"
if [[ ! -d "$substr_search_dir" ]]; then
  git clone https://github.com/zsh-users/zsh-history-substring-search "$substr_search_dir" 
fi

if [ -z "$installed_omz" ]; then
  echo
  echo
  echo "Oh-My-Zsh was installed from this script, make sure to re-source ~/.zshrc."
  echo
  echo
fi
