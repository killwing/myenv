# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes
PS1='\[\e[35;1m\]\h:\w\[\e[01;33m\]$(__git_ps1)$(kube_ps1) \[\e[35;1m\]# \[\e[0m\]'
#PROMPT_COMMAND='echo -n "]0;${PWD}"'

GIT_PS1_SHOWDIRTYSTATE=1

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\w\a\]$PS1"
    ;;
*)
    ;;
esac

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# keep the times of the commands in history.
HISTTIMEFORMAT='%F %T '

# autocorrect fudged paths in cd calls.
shopt -s cdspell

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# turn off flow control
stty -ixon

# paths
export PATH=/usr/local/bin:$HOME/bin:$HOME/.myenv/scripts:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export NODE_PATH=/usr/local:/usr/local/lib/node_modules

if [ `uname` == 'Darwin' ];then
    MAC_BREW_PREFIX=`brew --prefix`

    # enable programmable completion features (you don't need to enable this,
    # if it's already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
    # put completion files in /etc/bash_completion.d/
    if [ -f $MAC_BREW_PREFIX/etc/bash_completion ]; then
        . $MAC_BREW_PREFIX/etc/bash_completion
    fi

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
                mv "$path" ~/.Trash/"$dst"
            fi
        done
    }

    alias ls='ls -G'
elif [ `uname` == 'Linux' ];then
    . $HOME/bin/git-completion.bash
    . $HOME/bin/git-prompt.sh

    alias rm='mv -t ~/.local/share/Trash/files --backup=t'
    alias ls='ls --color=auto'
fi

# https://brbsix.github.io/2015/11/23/perform-tab-completion-for-aliases-in-bash/
alias_completion() {
    # keep global namespace clean
    local cmd completion

    # determine first word of alias definition
    # NOTE: This is really dirty. Is it possible to use
    #       readline's shell-expand-line or alias-expand-line?
    cmd=$(alias "$1" | sed "s/^alias .*='\(.*\)'/\1/g")

    # determine completion function
    completion=$(complete -p "$1" 2>/dev/null)

    # run _completion_loader only if necessary
    [[ -n $completion ]] || {

        # load completion
        #_completion_loader "$cmd"

        # detect completion
        completion=$(complete -p "$cmd" 2>/dev/null)
    }

    # ensure completion was detected
    [[ -n $completion ]] || return 1

    # configure completion
    eval "$(sed "s/$cmd\$/$1/" <<<"$completion")"
}

# alias
alias l='ls -hlF'
alias ll='l -a'
alias lt='l -tr'
alias la='ls -A'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'

alias tgc='tar czvf'
alias tgx='tar xzvf'
alias tgl='tar tzvf'
alias pa='ps auxf'
alias pt='ps H -o user,pid,lwp,nlwp,%cpu,%mem,vsz,rss,stat,start,time,command,comm,wchan -p'
alias h='history'
alias md='mkdir -p'

alias gi='gvim' # --servername GVIM --remote-silent'
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
alias git=hub
alias kc=kubectl
alias_completion kc
alias de='docker'
alias_completion de

function lslp {
    lsof -n -i4TCP:$1 | grep LISTEN
}

# jump around
. $HOME/bin/z.sh

# kubectl
. /usr/local/opt/kube-ps1/share/kube-ps1.sh

# source local file
if [ -e "$HOME/.bash_local" ]; then
    . "$HOME/.bash_local"
fi

