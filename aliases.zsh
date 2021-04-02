# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadcli="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -ahlF --color --group-directories-first"
weather() { curl -4 wttr.in/${1:-delaware} }
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"
alias zbundle="antibody bundle < $DOTFILES/zsh_plugins.txt > $DOTFILES/zsh_plugins.sh"
alias brewup="brew update && brew upgrade && brew cleanup"
#alias gitbrdel="git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d"
alias jv='java -version'
alias la='ls -alh --git'
alias ls='exa'
