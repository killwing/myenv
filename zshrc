# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/kelvin/.oh-my-zsh

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
# DISABLE_AUTO_UPDATE="true"

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
  git kube-ps1 autojump zsh-autosuggestions
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
                    dst="$dst "$(date +%H-%M-%S)
                done
                /bin/mv "$path" ~/.Trash/"$dst"
            fi
        done
    }
elif [ `uname` = 'Linux' ]; then
    alias rm='mv -t ~/.local/share/Trash/files --backup=t'
fi

function lslp {
    lsof -n -i4TCP:$1 | grep LISTEN
}

bindkey '^[^[[C' forward-word
bindkey '^[^[[D' backward-word
bindkey -r '^[[3~'
bindkey '^[[3~' kill-word
bindkey -M menuselect '^M' .accept-line
bindkey '^[^M' autosuggest-execute

export PATH=/usr/local/bin:$HOME/bin:$HOME/.myenv/scripts:$HOME/go/bin:$HOME/.krew/bin:$PATH

alias -s go='go run'
alias -s gz='tar xzvf'
alias -s tgz='tar xzvf'
alias -s zip='unzip'
alias -s bz2='tar xjvf'

alias tgc='tar czvf'
alias tgl='tar tzvf'
alias pa='ps auxf'
alias pt='ps H -o user,pid,lwp,nlwp,%cpu,%mem,vsz,rss,stat,start,time,command,comm,wchan -p'
alias h='history'

alias vi='vim'
alias fu='fuser -vun'
alias fn='find . -name'
alias fp='find . -path'
alias nt='netstat -lnptu'
alias nc='netcat -vz'
alias dud='du -hc --max-depth=1'
alias dft='df -Th'

alias agi='apt-get install'
alias sc='systemctl'
alias pj='python -m json.tool'
alias sf='sift --git --group -n'
alias ris='printf "\033c"' # hard reset

alias denter='screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty'
alias kc=kubectl
alias de=docker

kubeon

if [ -f ~/.zsh_local ]; then
    source ~/.zsh_local
fi
