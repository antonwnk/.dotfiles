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
confirm_install() {
    read -p "$1 Shallz we install it? [y/N] "
    case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
        y|yes) echo "yes" ;;
        *)     echo "no" ;;
    esac
}

command_or_bust zsh
command_or_bust curl
command_or_bust nvim


vim_plug_dir="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
if [[ ! -d "$vim_plug_dir" ]]; then
  so_question_mark=$(confirm_install "Seems that vim-plug is missing.")
  if [[ "$so_question_mark" == "yes" ]]; then
    curl -fLo "$vim_plug_dir"  --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
fi

if [[ ! -d "${ZSH:-$HOME/.oh-my-zsh}" ]]; then
  so_question_mark=$(confirm_install "Seems that oh-my-zsh is missing.")
  if [[ "$so_question_mark" == "yes" ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi
  installed_omz="yep"
fi

autosuggest_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
if [[ ! -d "$autosuggest_dir" ]]; then
  so_question_mark=$(confirm_install "Seems that zsh-autosuggestions is missing.")
  if [[ "$so_question_mark" == "yes" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$autosuggest_dir"
  fi
fi 

syntax_hl_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
if [[ ! -d "$syntax_hl_dir" ]]; then
  so_question_mark=$(confirm_install "Seems that zsh-syntax-highlighting is missing.")
  if [[ "$so_question_mark" == "yes" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$syntax_hl_dir" 
  fi
fi

substr_search_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-history-substring-search"
if [[ ! -d "$substr_search_dir" ]]; then
  so_question_mark=$(confirm_install "Seems that zsh-history-substring-search is missing.")
  if [[ "$so_question_mark" == "yes" ]]; then
    git clone https://github.com/zsh-users/zsh-history-substring-search "$substr_search_dir" 
  fi
fi

tmux_plugin_mgr_dir="$HOME/.tmux/plugins/tpm"
if [[ ! -d "$tmux_plugin_mgr_dir" ]]; then
  so_question_mark=$(confirm_install "Seems that TPM is missing.")
  if [[ "$so_question_mark" == "yes" ]]; then
    git clone https://github.com/tmux-plugins/tpm "$tmux_plugin_mgr_dir"
  fi
fi

if [ -n "$installed_omz" ]; then
  echo
  echo
  echo "Oh-My-Zsh was installed from this script, make sure to re-source ~/.zshrc."
  echo
  echo
fi
