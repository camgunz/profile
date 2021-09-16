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

1password() {
    eval $(${HOME}/bin/op signin my.1password.com charles.gunyon@gmail.com ${ONE_PASSWORD_SECRET_KEY})
}

list_logins() {
    op list items | jq .[].overview.title | uniq | sort
}

add_login() {
    # [TODO] Read password from STDIN
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

    item=$(op get item "${title}" --fields username --fields password --fields website)
    if [ $? != 0 ]
    then
        exit
    fi

    username=$(echo "${item}" | jq -cr .username)
    password=$(echo "${item}" | jq -cr .password)
    website=$(echo "${item}" | jq -cr .website)
    totp=$(op get totp "${title}" 2> /dev/null)

    if [ "${username}" != 'null' -a ! -z "${username}" ]
        then echo "Username: ${username}"
    fi

    if [ "${website}" != 'null' -a ! -z "${website}" ]
        then echo "Website:  ${website}"
    fi

    if [ "${password}" != 'null' -a ! -z "${password}" ]
    then
        echo "${password}" | xclip -r
    fi

    if [ ! -z "${totp}" ]
    then
        echo "TOTP:     ${totp}"
    fi
}

export NVM_DIR="${HOME}/.nvm"

if [ $(uname) = 'Darwin' ]
then
    if [ -z ${SSH_AGENT_PID} ]
    then
        ssh-add -q ~/.ssh/id_ed25519    # Paladin?
        ssh-add -q ~/.ssh/id_bitbucket
        ssh-add -q ~/.ssh/id_github
        ssh-add -q ~/.ssh/id_prgmr
        ssh-add -q ~/.ssh/id_router
        ssh-add -q ~/.ssh/id_rsa3
        ssh-add -q ~/.ssh/id_totaltrash
        ssh-add -q ~/.ssh/id_ttgithub
        ssh-add -q ~/.ssh/id_nea_bitbucket
        # ssh-add -q ~/.ssh/bad_id_rsa  # --invalid format--
        # ssh-add -q ~/.ssh/id_dsa      # Passphrase
        # ssh-add -q ~/.ssh/id_router2  # Unknown passphrase
        # ssh-add -q ~/.ssh/id_router3  # --invalid format--
        # ssh-add -q ~/.ssh/id_rsa      # Passphrase
        # ssh-add -q ~/.ssh/id_rsa2     # Passphrase
        # ssh-add -q ~/.ssh/id_rsa4     # Unknown passphrase
    fi

    # export PYENV_ROOT=$HOME/.pyenv

    # PATH="${PYENV_ROOT}/bin:${PATH}"
    # PATH="/usr/local/opt/postgresql@9.6/bin:${PATH}"

    # This loads nvm
    if [ -r /usr/local/opt/nvm/nvm.sh ]
    then
        . /usr/local/opt/nvm/nvm.sh
    fi

    # This loads nvm bash_completion
    if [ -r /usr/local/opt/nvm/etc/bash_completion ]
    then
        . /usr/local/opt/nvm/etc/bash_completion
    fi

    # eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"

    if [ -f $(brew --prefix)/etc/bash_completion ]
    then
      . $(brew --prefix)/etc/bash_completion
    fi

    # GOROOT='/usr/local/Cellar/go/1.10.3/libexec/bin'

    alias pg_ctl='pg_ctl -D /usr/local/var/postgresql@9.6'
    alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g -f'
    alias sqlite3='/usr/local/opt/sqlite3/bin/sqlite3'
    alias rlpsql='rlwrap --always-readline --no-children psql'
else
    if [ -z ${SSH_AGENT_PID} ]
    then
        eval $(ssh-agent)
        ssh-add -q ~/.ssh/id_ed25519    # Paladin?
        ssh-add -q ~/.ssh/id_bitbucket
        ssh-add -q ~/.ssh/id_github
        ssh-add -q ~/.ssh/id_prgmr
        ssh-add -q ~/.ssh/id_router
        ssh-add -q ~/.ssh/id_rsa3
        ssh-add -q ~/.ssh/id_totaltrash
        ssh-add -q ~/.ssh/id_ttgithub
        ssh-add -q ~/.ssh/id_nea_bitbucket
        # ssh-add -q ~/.ssh/bad_id_rsa  # --invalid format--
        # ssh-add -q ~/.ssh/id_dsa      # Passphrase
        # ssh-add -q ~/.ssh/id_router2  # Unknown passphrase
        # ssh-add -q ~/.ssh/id_router3  # --invalid format--
        # ssh-add -q ~/.ssh/id_rsa      # Passphrase
        # ssh-add -q ~/.ssh/id_rsa2     # Passphrase
        # ssh-add -q ~/.ssh/id_rsa4     # Unknown passphrase
    fi

    if [ -r ${NVM_DIR}/nvm.sh ]
    then
        . ${NVM_DIR}/nvm.sh
    fi

    if [ -r ${NVM_DIR}/bash_completion ]
    then
        . ${NVM_DIR}/bash_completion
    fi
fi

if [ $(basename $SHELL) = 'zsh' ]
then
    PS1='[%* %/]$ '
else
    PS1='[\t \w]\$ '
fi

alias wget='curl -O'
alias ls='ls -G'
alias rawgrep=$(which grep)
alias grep='grep --exclude-dir={static,static_source,node_modules,diffs,save_states}'
alias load1p='grep ONE ~/.secrets | cut -d = -f 2 | pbcopy'

venv() {
    . ${VIRTUALENV_FOLDER}/${1}/bin/activate
}

gitsu() {
    branch=$(git status | head -n 1 | cut -d ' ' -f 3)
    git push --set-upstream origin ${branch}
}

git_add_conflicts() {
    git add $(git status | rawgrep 'both modified:' | cut -d ':' -f2)
}

EDITOR=vim
LC_ALL=en_US.UTF-8
GOPATH="${HOME}/code/go"
PATH=$PATH:"$(go env GOPATH)/bin"
PATH=$PATH:"${HOME}/.cargo/bin"
PATH=$PATH:"${HOME}/bin"
PATH=$PATH:"${HOME}/.local/bin"
PATH=$PATH:/usr/local/opt/openjdk/bin
PATH=$PATH:/Library/PostgreSQL/13/bin
PATH=$PATH:'/Applications/Racket v8.2/bin/'
LSCOLORS='EhgxfdfxcxDxDxBxeded'
PIM_FOLDER="${HOME}/.cg_pim"
VIRTUALENV_FOLDER="${HOME}/.virtualenvs"
SAM_CLI_TELEMETRY=0
DOOMWADDIR="${HOME}/.d2k/wads"
MAKEFLAGS=-j8

export EDITOR GOPATH LC_ALL LSCOLORS NVM_ROOT PATH PIM_FOLDER PS1
export SAM_CLI_TELEMETRY DOOMWADDIR MAKEFLAGS

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
. "$HOME/.cargo/env"
