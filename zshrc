# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="kw"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  z git kube-ps1 zsh-autosuggestions kubectl virtualenv
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

unsetopt share_history

if [ `uname` = 'Darwin' ]; then
    # move to trash, from macworld hints
    function rm() {
        local path
        for path in "$@"; do
            # ignore any arguments
            if [[ "$path" = -* ]]; then :
            else
                local dst=${path##*/}
                # append the time if necessary
                while [ -e ~/.Trash/"$dst" ]; do
                    dst="$dst "$(/bin/date +%H-%M-%S)
                done
                /bin/mv "$path" ~/.Trash/"$dst"
            fi
        done
    }
elif [ `uname` = 'Linux' ]; then
    alias rm='mv -t ~/.local/share/Trash/files --backup=t'
fi

function lslp {
    lsof -nP -i4TCP:$1 | grep LISTEN
}

# ctrl
# tip: use `xxd` / `cat` / `showkey -a` to show the keycode
# in iTerm2:
# ctrl+Bs: ^H Backspace
# ctrl+Del: Esc+[3;5~
# ctrl+Enter: Esc+[[CE
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey '^J' autosuggest-execute
bindkey '^[[[CE' autosuggest-execute
bindkey \^U backward-kill-line # bash-like

# alt
# alt-x : insert last command result
zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey '^[x' insert-last-command-output

# shift
# shift-tab : go backward in menu (invert of tab)
bindkey '^[[Z' reverse-menu-complete

bindkey -M menuselect '^M' .accept-line

alias -s go='go run'
alias -s gz='gunzip'
alias -s zip='unzip'
alias -s tgz='tar xzvf'
alias -s bz2='tar xjvf'
alias -s tar.xz='tar xJvf'
alias -s tar.gz='tar xzvf'
alias -s tar='tar xvf'

# better
alias npm='pnpm'
alias vi='nvim'
alias cat='bat -pp'

alias tgc='tar czvf'
alias tgl='tar tzvf'
alias pa='ps auxf'
alias pt='ps H -o user,pid,lwp,nlwp,%cpu,%mem,vsz,rss,stat,start,time,command,comm,wchan -p'
alias h='history'

alias fu='fuser -vun'
alias fn='find . -name'
alias fp='find . -path'
alias nt='netstat -lnptu'
alias dud='du -hc --max-depth=1'
alias dft='df -Th'

alias agi='apt-get install'
alias bb='brew bundle'
alias sc='systemctl'
alias pj='python -m json.tool'
alias sf='sift --git --group -n'
alias ris='printf "\033c"' # hard reset

alias kc=kubectl
alias cl=colima
alias http='http -s monokai'
alias pc='proxychains4'
alias zj='zellij'
#source <(kubectl completion zsh)

kubeon

KUBE_PS1_SYMBOL_DEFAULT='\u2638\ufe0f '

# set other local envs in .zshenv
export PATH=/opt/homebrew/bin:$PATH:$HOME/bin:$HOME/go/bin:$HOME/.myenv/scripts:$HOME/.krew/bin:$HOME/gdrive/work/bin
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=true

