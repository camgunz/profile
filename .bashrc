#
# ~/.bashrc
#

# If not running interactively, don't do anything
if [[ $- != *i* ]]
then
    return
fi

set -o vi

if [ -f ${HOME}/.secrets ]
then
    . ${HOME}/.secrets
fi

personal_1password() {
    eval $(${HOME}/bin/op signin my.1password.com charles.gunyon@gmail.com ${PERSONAL_1PASSWORD_SECRET_KEY})
}

paladin_1password() {
    eval $(${HOME}/bin/op signin paladin.1password.com charlie@joinpaladin.com ${PALADIN_1PASSWORD_SECRET_KEY})
}

list_logins() {
    op list items | jq .[].overview.title | uniq | sort
}

add_login() {
    title="${1}"
    username="${2}"
    password="${3}"
    template=$(op get template login)
    item=$(echo "${template}" | jq -c ".fields[0].value = \"${username}\"" | jq -c ".fields[1].value = \"${password}\"")
    encoded_item=$(echo "${item}" | ${HOME}/bin/op encode)
    op create item Login ${encoded_item} --title="${title}" --vault=Personal
}

get_login() {
    title="${1}"
    item=$(op get item "${title}")
    echo "Username: $(echo "${item}" | jq '.details.fields[0].value')"
    echo "Password: $(echo "${item}" | jq '.details.fields[1].value')"
}

if [ $(uname) == 'Darwin' ]
then
    if [ -z ${SSH_AGENT_PID} ]
    then
        ssh-add ~/.ssh/id_bitbucket
        ssh-add ~/.ssh/id_ed25519
        ssh-add ~/.ssh/id_prgmr
        ssh-add ~/.ssh/id_totaltrash
    fi

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

    if [ -f $(brew --prefix)/etc/bash_completion ]
    then
      . $(brew --prefix)/etc/bash_completion
    fi

    GOROOT='/usr/local/Cellar/go/1.10.3/libexec/bin'

    alias pg_ctl='pg_ctl -D /usr/local/var/postgresql@9.6'
    alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g -f'
    alias sqlite3='/usr/local/opt/sqlite3/bin/sqlite3'
else
    if [ -z ${SSH_AGENT_PID} ]
    then
        eval $(ssh-agent)
        ssh-add ~/.ssh/id_bitbucket
        ssh-add ~/.ssh/id_dsa
        ssh-add ~/.ssh/id_github
        ssh-add ~/.ssh/id_prgmr
        ssh-add ~/.ssh/id_router
        ssh-add ~/.ssh/id_router2
        ssh-add ~/.ssh/id_rsa
        ssh-add ~/.ssh/id_rsa2
        ssh-add ~/.ssh/id_totaltrash
    fi

    if [ -z "$NVM_DIR" ]
    then
        export NVM_DIR="${HOME}/.nvm"
        . /usr/share/nvm/nvm.sh
        . /usr/share/nvm/bash_completion
        . /usr/share/nvm/install-nvm-exec
    fi

    GOROOT=${HOME}/local/go
fi

alias wget='curl -O'
alias ls='ls -G'
alias rawgrep=$(which grep)
alias grep='grep --exclude-dir={static,static_source,node_modules}'

venv() {
    . ${VIRTUALENV_FOLDER}/${1}/bin/activate
}

eslint_fix() {
    node_modules/.bin/eslint --fix 'paladin/static_source/js/src/**' $*
}

celery_worker() {
    celery worker --beat --loglevel=INFO --app=paladin.paladin.celery:app
}

gitsu() {
    branch=$(git status | head -n 1 | cut -d ' ' -f 3)
    git push --set-upstream origin ${branch}
}

git_add_conflicts() {
    git add $(git status | rawgrep 'both modified:' | cut -d ':' -f2)
}

PS1='[\t \w]\$ '
GOPATH="${HOME}/code/go"
PATH=$PATH:${GOROOT}/bin:$(go env GOPATH)/bin
PATH=$PATH:"${HOME}/.cargo/bin"
PATH=$PATH:${HOME}/bin
LSCOLORS='EhgxfdfxcxDxDxBxeded'
PIM_FOLDER="${HOME}/.cg_pim"
VIRTUALENV_FOLDER=${HOME}/.virtualenvs"
SAM_CLI_TELEMETRY=0
DOOMWADDIR="${HOME}/.d2k/wads"

export PS1 GOROOT GOPATH PATH LSCOLORS PIM_FOLDER SAM_CLI_TELEMETRY DOOMWADDIR

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
