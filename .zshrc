[[ "$TERM" != "screen" ]] && exec screen -xR

PS1="%m:%~ %n\$ "

autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

setopt BASH_AUTO_LIST
setopt LIST_AMBIGUOUS
setopt AUTO_PUSHD

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history

export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="/usr/local/bin:$PATH"

export PATH="/Applications/MAMP/bin/php/php5.3.14/bin:$PATH"
export PATH="/Applications/MAMP/Library/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
[[ -x $HOME/.rbenv/bin/rbenv ]] && eval "$(rbenv init -)"

if [ -x "/usr/local/opt/coreutils/libexec/gnubin/ls" ]; then
    alias ls="ls --color=auto"
    alias ll="ls -l --color=auto"
    alias la="ls -la --color=auto"
fi

export GREP_OPTIONS='--color=auto'

alias telnets="openssl s_client -connect"

[[ -f ~/perl5/perlbrew/etc/bashrc ]] && source ~/perl5/perlbrew/etc/bashrc

preexec() {
    echo -ne "\ek$(echo $1 | awk '{print $1}')\e\\"
}

precmd() {
    echo -ne "\ek$(basename $PWD)\e\\"
}

[[ -f .zshrc.local ]] && source .zshrc.local
