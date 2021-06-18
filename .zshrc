export TERM="xterm-256color"

source /usr/share/zsh/scripts/zplug/init.zsh

# Theme
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_STATUS_CROSS=true

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

POWERLEVEL9K_TIME_BACKGROUND="yellow"
POWERLEVEL9K_TIME_FOREGROUND="black"
POWERLEVEL9K_TIME_FORMAT="%B%D{%H:%M:%S}"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

POWERLEVEL9K_OS_ICON_FOREGROUND="108"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'

# Plugins
if [ "$TERM" != 'linux' ]; then
  source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
else
  export PS1="%{%F{yellow}%}%n%{%f%} %~ › "
fi
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "yukiycino-dotfiles/fancy-ctrl-z"

# History configuration
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt correct # Command correction

setopt globdots # Hidden files tab completion

setopt auto_pushd

stty -ixon # Disables XON/XOFF flow control

zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")'; # Tab colors

# Completion options
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

export ANDROID_HOME=${HOME}/Android/Sdk
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk/jre"
export _JAVA_AWT_WM_NONREPARENTING=1 # Fixes grey java apps
export PATH=${PATH}:${HOME}/.bin
export PATH=${PATH}:${HOME}/.local/bin
export PATH=${PATH}:${ANDROID_HOME}/emulator
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:${HOME}/.yarn/bin
export PATH=${PATH}:${JAVA_HOME}/bin:$PATH
export PATH=${PATH}:${HOME}/lib/flutter/bin
export PATH="$HOME/.symfony/bin:$PATH"

export FZF_DEFAULT_COMMAND='fd --hidden --type f --follow --color=always --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export _JAVA_OPTIONS=-Djava.io.tmpdir=/var/tmp
export VISUAL=vim
export EDITOR="$VISUAL"

# Fixes keys
bindkey -e
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[7~" beginning-of-line
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
bindkey "\e[8~" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[H" beginning-of-line

# Enables shift tab
bindkey '^[[Z' reverse-menu-complete

# Enables emacs mode

set -o emacs

# Arrows search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

eval $(keychain --eval --quiet id_rsa $HOME/.ssh/id_rsa)

# Shortcuts
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias sv='sudo -E nvim'
alias bc='bc -ql'
alias ls='exa'
alias la='exa -a'
alias ll='exa -l'
alias lla='exa -la'
alias cal='cal -m'
alias rndbg='adb shell input keyevent 82'
alias logcat="adb logcat -v color"
alias grep="rg"
alias find="fd"
alias f="fd"
alias t='tmux -2'
alias j='just'
alias open-workspace='teamocil --layout ./.teamocil.yml --here'
alias gpurge='purge = branch --merged master | grep -v master | xargs git branch -d'
alias dcps="docker-compose ps"
alias dce='docker-compose exec'
alias dc='docker-compose'
alias dcs="docker stop $(docker ps -aq)"
alias dcp="docker rm $(docker ps -aq)"
alias pbcopy="xclip -sel clip"
alias docker-top='docker run -ti -v /var/run/docker.sock:/var/run/docker.sock quay.io/vektorlab/ctop:latest'

zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_CTRL_T_OPTS="--bind ?:toggle-preview --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}


# pierpo/fzf-docker
# doesn't work with zplug...

_fzf_complete_docker() {
  # Get all Docker commands
  #
  # Cut below "Management Commands:", then exclude "Management Commands:",
  # "Commands:" and the last line of the help. Then keep the first column and
  # delete empty lines
  DOCKER_COMMANDS=$(docker --help 2>&1 >/dev/null |
    sed -n -e '/Management Commands:/,$p' |
    grep -v "Management Commands:" |
    grep -v "Commands:" |
    grep -v 'COMMAND --help' |
    grep .
  )

  ARGS="$@"
  if [[ $ARGS == 'docker ' ]]; then
    _fzf_complete "--reverse -n 1 --height=80%" "$@" < <(
      echo $DOCKER_COMMANDS
    )
  elif [[ $ARGS == 'docker rmi'* || $ARGS == 'docker -f'* ]]; then
    _fzf_complete "--multi --reverse" "$@" < <(
      docker images --format '{{.Repository}}:{{.Tag}}'
    )
  elif [[ $ARGS == 'docker start'* || $ARGS == 'docker restart'* || $ARGS == 'docker stop'* || $ARGS == 'docker rm'* || $ARGS == 'docker exec'* || $ARGS == 'docker kill'* ]]; then
    _fzf_complete "--multi --reverse" "$@" < <(
      docker ps --format '{{.Names}}'
    )
  fi
}

_fzf_complete_docker_post() {
  # Post-process the fzf output to keep only the command name and not the explanation with it
  awk '{print $1}'
}

[ -n "$BASH" ] && complete -F _fzf_complete_docker -o default -o bashdefault docker

# Find in files and return filenames
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --height 40% --multi --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --pretty --context 10 '$1' || rg --pretty --context 10 '$1' {}"
}

rp() {
  sd $1 $2 $(fif $1)
}
