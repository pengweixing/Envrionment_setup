alias ll="ls -hltr"
alias l="ls -hltr"
export CLICOLOR=1
alias l="ll -hltr"
alias les="less -S"
export HISTIGNORE='pwd:ls:ls -ltr:cd:ll:history:'
PS1="\[\e[1;33m\][\u@\h:\[\e[1;34m\] \t \[\e[32m\]\w]\n\[\e[33m\]$\[\e[m\]"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/penxi331/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/penxi331/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/penxi331/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/penxi331/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias rackham='ssh pengwei@rackham.uppmax.uu.se'
