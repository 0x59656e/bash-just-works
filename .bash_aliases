# Generals 
alias sudo='sudo '
alias vi='vim'
alias vibs='vim ~/.bashrc'
alias bsrc='source ~/.bashrc'
alias l='ls -lAhHF --group-directories-first --color=auto'
alias ll='ls -lhHF --group-directories-first --color=auto'
alias lles='ls -lAhHF --group-directories-first --color=auto | less -r'
alias llles='ls -lhHF --group-directories-first --color=auto | less -r'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias t2='tree -L 2'
alias t3='tree -L 3'
alias rm='rm -i'
alias cp='rsync -az'
alias mv='mv -i'
alias md='mkdir -pv'
alias hisgrp='history|grep --color=auto'
alias die='shutdown now'
alias dld='wget -bq --tries=5'
alias rlog='tail -f'

# System Information
alias mnt='mount | column -t'
alias meminfo='free -hlt'
alias psfind='ps -ef | grep --color=auto '

# Text Manipulation
alias grep='grep --color=auto'

# Permission
alias chx='chmod --preserve-root 755'
alias chrw='chmod --preserve-root 644'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias chown='chown --preserve-root'

# Date and Time
alias utcdate='date -u +"%Y-%m-%dT%H:%M:%SZ"'
alias utctime='date -u +"%T"'
alias localdate='date +"%Y-%m-%dT%H:%M:%SZ"'
alias localtime='date +"%T"'

# Network
alias dtcp='netstat -tlnp'
alias fping='ping -c 10 -i .5'
alias tcp='ss -t4p'
alias ftcp='ss -t4p state'
alias xtcp='ss -t4p exclude'
alias udp='ss -u4p'
alias myip='curl ifconfig.me'

# iptables
alias arules='iptables -vnL --line-numbers'
alias irules='iptables -L INPUT -nv --line-numbers'
alias orules='iptables -L OUTPUT -nv --line-numbers'
alias fwrules='iptables -L FORWARD -nv --line-numbers'

# Software Management
alias apt-get="sudo apt-get"
alias apt-upgrade='sudo apt-get update && sudo apt-get upgrade'
alias testapt='apt-get install -qsy'

# Tmux
alias tnew='tmux new -s '
alias tkill='tmux kill-session -t '
alias ta='(tmux has-session 2>/dev/null && tmux attach) || (tmux new-session)'
