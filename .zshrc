# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

bindkey "\E[1~" beginning-of-line
bindkey "\E[4~" end-of-line

ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export PATH="$HOME/.emacs.d/bin:$PATH"
source ~/powerlevel10k/powerlevel10k.zsh-theme

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

### Add Zinit's plugins

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

### End of Zinit's plugins

### ZSH history settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt INC_APPEND_HISTORY  
setopt SHARE_HISTORY
### End of ZSH history settings

# JAVA_HOME

export JAVA_HOME="~/java/jdk-17.0.6+10/bin/java"

### Rust

export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library

### End of Rust's section

### Golang

export PATH=$PATH:/usr/bin/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

### End of Golang's section

### PATH definitions

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

### End of PATH definitions 

### Python settings
export PYTHONBREAKPOINT='ipdb.set_trace'
### End of Python

### Load Secrets

source ~/.secrets/secrets.zsh

### End of Secrets

### Aliases

export DOTFILES="$HOME/.git/github/dotfiles"
export EXERCISM_PATH="$HOME/snap/exercism/5/exercism"

alias v='lvim'
alias e='emacs -nw'
alias cdg='cd ~/.git'
alias cdgl='cd ~/.git/gitlab'
alias cdgh='cd ~/.git/github'
alias dotfiles="cd $DOTFILES"
alias exerc="cd $EXERCISM_PATH"
alias ls='exa --icons'
alias ll='exa -l --icons'
alias tree='exa --tree --git-ignore --icons'
alias ipython='python -m IPython'
alias login_ssh='eval `ssh-agent -s` && ssh-add'
alias sz='source ~/.zshrc'
alias minecraft='java -jar TLauncher-2.86.jar'
alias tibia='~/Tibia/Tibia &'

### End of Aliases

export TERM=screen-256color

[ -f "/home/nezlit/.ghcup/env" ] && source "/home/nezlit/.ghcup/env" # ghcup-env

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
