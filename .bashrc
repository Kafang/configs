#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Make colorcoding available for everyone

Black='\[\e[0;30m\]'	# Black
Red='\[\e[0;31m\]'		# Red
Green='\[\e[0;32m\]'	# Green
Yellow='\[\e[0;33m\]'	# Yellow
Blue='\[\e[0;34m\]'		# Blue
Purple='\[\e[0;35m\]'	# Purple
Cyan='\[\e[0;36m\]'		# Cyan
White='\[\e[0;37m\]'	# White

# Bold
BBlack='\[\e[1;30m\]'	# Black
BRed='\[\e[1;31m\]'		# Red
BGreen='\[\e[1;32m\]'	# Green
BYellow='\[\e[1;33m\]'	# Yellow
BBlue='\[\e[1;34m\]'	# Blue
BPurple='\[\e[1;35m\]'	# Purple
BCyan='\[\e[1;36m\]'	# Cyan
BWhite='\[\e[1;37m\]'	# White

# Background
On_Black='\[\e[40m\]'	# Black
On_Red='\[\e[41m\]'		# Red
On_Green='\[\e[42m\]'	# Green
On_Yellow='\[\e[43m\]'	# Yellow
On_Blue='\[\e[44m\]'	# Blue
On_Purple='\[\e[45m\]'	# Purple
On_Cyan='\[\e[46m\]'	# Cyan
On_White='\[\e[47m\]'	# White

NC='\[\e[m\]'			# Color Reset

ALERT="${BWhite}${On_Red}" # Bold White on red background
 
# Useful aliases
#alias c='clear'
alias sl='sl -e' 
alias ..='cd ..'
alias ls='ls -CF --color=auto'
alias ll='ls -lisa --color=auto'
alias mkdir='mkdir -pv'
alias free='free -mt'
alias ps='ps auxf'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias wget='wget -c'
alias histg='history | grep'
alias myip='curl ipv4.icanhazip.com'
alias grep='grep --color=auto'
alias ebrc='$EDITOR ~/.bashrc'
alias c='sudo ~/connect.sh'
alias pa="pulseaudio --daemonize ; start-pulseaudio-x11" 
alias ff="firefox" 
alias cpf="c && pa && ff & anki "
alias burp="~/BurpSuiteCommunity/BurpSuiteCommunity"
# Set PATH so it includes user's private bin directories
PATH="${HOME}/.gem/ruby/3.0.0/bin:${HOME}/.gem/ruby/2.7.0/bin:${HOME}/racket/bin:${HOME}/eclipse:${HOME}/bin:${HOME}/.local/bin:${PATH}:${HOME}/Downloads/HITCON/depot_tools"
 
# Set prompt (Fallback if other one would be broken comment it out!)
PS1="${Yellow}\u@\h${NC}: ${Blue}\w${NC} \\$ "

xset s on 
xset s 30
wal -n -a"50" -s 0.1 -i /home/kai/.config/i3/andy_wallpaper.jpg -e -q
export EDITOR='vim'

# Vim keybinds for everything!!!
set -o vi

#Shell
source /usr/share/git/git-prompt.sh
export PS1="\$(__git_ps1){\$?}[\[$(tput sgr0)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;11m\]\l\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;11m\]\h\[$(tput sgr0)\]]\[$(tput sgr0)\]\[\033[38;5;0m\]\[\033[48;5;13m\][\w]\[$(tput sgr0)\]\[\033[48;5;2m\]\\$>\[$(tput sgr0)\]"
export LFS=/mnt/lfs
source "$HOME/.cargo/env"
clear
clear
shuf -n 1 /usr/share/doc/radare2/fortunes.fun
