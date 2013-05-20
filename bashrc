# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes
PS1="\[\e[35;1m\]\h:\w # \[\e[0m\]"
#PROMPT_COMMAND='echo -n "]0;${PWD}"'

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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

# turn off beep
setterm -bfreq 0

# PATHs
export PATH=$PATH:$HOME/bin/:$HOME/github/myenv/scripts/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
export NODE_PATH=/usr/local:/usr/local/lib/node_modules


# set ls colors
eval `dircolors`

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep -Ins --color=auto --exclude-dir=.git'
alias fgrep='fgrep -Ins --color=auto'
alias egrep='egrep -Ins --color=auto'

alias l='ls -hlF'
alias ll='l -a'
alias lt='l -tr'
alias la='ls -A'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

alias tgc='tar czvf'
alias tgx='tar xzvf'
alias tgl='tar tzvf'
alias pa='ps auxf'
alias h='history'
alias md='mkdir -p'
alias rm='mv -t ~/.local/share/Trash/files --backup=t'

alias gi='gvim' # --servername GVIM --remote-silent'
alias fu='fuser -vun'
alias nt='netstat -lnptu'
alias nc='netcat -vz'
alias dud='du -hc --max-depth=1'
alias dft='df -Th'

alias pd='pushd .'

alias agi='apt-get install'

alias ct='cleartool'
alias cl='cleartool lsco -me -cview -short -all'
alias ci='cleartool ci -nc'
alias co='cleartool co -nc -unr'
alias uc='cleartool unco -rm'
alias crm='cleartool lsp -oth|xargs rm -rf'
alias xdiff='cleartool diff -g -pred'
alias cf='cleartool find . -branch "brtype(branch_name)" -print -nxn'

# source local file
if [ -e "$HOME/.bash_local" ]; then
    . "$HOME/.bash_local"
fi

