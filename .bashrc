#
# ~/.bashrc
#

# If not running interactively, don't do anything
if [[ $- != *i* ]]
then
    return
fi

set -o vi

alias wget='curl -O'
alias ls='ls -G'

gitsu() {
    branch=$(git status | head -n 1 | cut -d ' ' -f 3)
    git push --set-upstream origin ${branch}
}

if [ $(uname) == 'Darwin' ]
then
    alias pg_ctl='pg_ctl -D /usr/local/var/postgresql@9.6'
    alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g -f'
    alias grep='grep --exclude-dir={static,static_source,node_modules}'
    alias sqlite3='/usr/local/opt/sqlite3/bin/sqlite3'
fi

eslint_fix() {
    node_modules/.bin/eslint --fix 'paladin/static_source/js/src/**' $*
}

celery_worker() {
    celery worker --beat --loglevel=INFO --app=paladin.paladin.celery:app
}

PS1='[\u@\h \d \t]\$ '

export LSCOLORS PS1

alias status='clear; listtodo; listtimefor today'

alias logtime='~/bin/pim.py time_log add --description'
alias listtime='~/bin/pim.py time_log list'
alias listtimefor='~/bin/pim.py time_log list --range'
alias removetime='~/bin/pim.py time_log remove --id'
alias edittime='~/bin/pim.py time_log edit --id'
alias calctime='~/bin/pim.py time_log calc'

alias todo='~/bin/pim.py todo add --description'
alias listtodo='~/bin/pim.py todo list'
alias removetodo='~/bin/pim.py todo remove --id'
alias edittodo='~/bin/pim.py todo edit --id'
