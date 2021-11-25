# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
alias ps='ps -u pi'
alias ls='ls --color=auto'
alias hs='history'
alias hsr='history -r pk_history'
alias ec='emacsclient -c '
alias ed='emacs --daemon'
alias egrep='egrep --color=auto'
alias enw='emacs -nw'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias lsblk='lsblk -o name,size,mountpoint,label' # show disk's labels
alias ll='ls -l /dev/disk/by-label' # show disk labels with ls cmd
#alias setkey='setxkbmap -rules evdev -model pc105 -layout "us,sk" -option "grp:ctrls_toggle,grp_led:caps"'

alias setkey='setxkbmap -rules evdev -model pc105 -layout "us,sk,il" -option "grp:ctrls_toggle,grp_led:caps"'

#setxkbmap -option -option \
#grp:alt_shift_toggle,compose:lwin_switch,lv3:rwin_switch,grp_led:scroll


export HISTCONTROL=$HISTCONTROL:ignorespace
HISTCONTROL=ignoreboth


