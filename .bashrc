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
alias black80='black --py36 -S -l 80'
alias black120='black --py36 -S -l 120'

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

    eslint_fix() {
        node_modules/.bin/eslint --fix 'paladin/static_source/js/src/**' $*
    }

    celery_worker() {
        celery worker --beat --loglevel=INFO --app=paladin.paladin.celery:app
    }

    export PYENV_ROOT=$HOME/.pyenv
    export NVM_DIR="${HOME}/.nvm"

    PATH="${PYENV_ROOT}/bin:${PATH}"
    PATH="/usr/local/opt/postgresql@9.6/bin:${PATH}"

    # This loads nvm
    if [ -s /usr/local/opt/nvm/nvm.sh ]
    then
        . /usr/local/opt/nvm/nvm.sh
    fi

    # This loads nvm bash_completion
    if [ -s /usr/local/opt/nvm/etc/bash_completion ]
    then
        . /usr/local/opt/nvm/etc/bash_completion
    fi

    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi
fi

GOPATH="${HOME}/code/go"
GOROOT='/usr/local/Cellar/go/1.10.3/libexec/bin'
LSCOLORS='EhgxfdfxcxDxDxBxeded'

PATH="${PATH}:${GOROOT}/libexec/bin"
PATH="${PATH}:${HOME}/.cargo/bin"

PS1='[\d \t] \s-\v\$ '

export GOPATH GOROOT LSCOLORS PATH PS1

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
