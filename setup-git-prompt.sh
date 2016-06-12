#!/bin/bash
grep -q "PROMPT_COMMAND='__git_ps1" $HOME/.bashrc
if [ $? -eq 1 ] ; then
    echo "
GIT_PS1_SHOWDIRTYSTATE=yes
GIT_PS1_SHOWUNTRACKEDFILES=yes
GIT_PS1_SHOWCOLORHINTS=yes
source ~/.bash/git-prompt.sh
PROMPT_COMMAND='__git_ps1 \"\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\" \"\\\\\\$ \"'
" >> $HOME/.bashrc
fi
