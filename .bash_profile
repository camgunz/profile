eval $(ssh-agent)
ssh-add ~/.ssh/id_bitbucket
ssh-add ~/.ssh/id_prgmr
ssh-add ~/.ssh/id_totaltrash

if [ $(uname) == 'Darwin' ]
then
    ssh-add ~/.ssh/id_ed25519
elif [ -z ${SSH_AGENT_PID} ]
then
    ssh-add ~/.ssh/id_dsa
    ssh-add ~/.ssh/id_github
    ssh-add ~/.ssh/id_router
    ssh-add ~/.ssh/id_router2
    ssh-add ~/.ssh/id_rsa
    ssh-add ~/.ssh/id_rsa2
fi
