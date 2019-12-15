#
# ~/.bash_profile
#

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

    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi

    GOROOT='/usr/local/Cellar/go/1.10.3/libexec/bin'
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

GOPATH="${HOME}/code/go"
PATH=$PATH:${GOROOT}/bin:$(go env GOPATH)/bin
PATH=$PATH:"${HOME}/.cargo/bin"
PATH=$PATH:${HOME}/bin

LSCOLORS='EhgxfdfxcxDxDxBxeded'

export GOROOT GOPATH PATH LSCOLORS

