# toolbox
DevOps container with various tools 

The available Ansible version can be found here: https://pypi.org/project/ansible-core/#description

### Usage

If you can not use docker, try lima: https://github.com/lima-vm/lima  
Please note that the following examples contain both lima and docker. You need to run the script/command that matches your setup.  

#### Build
```bash
# docker
./docker_build.sh
# lima
./lima_build.sh
```

#### Run
Configure the variable `CODE` in the `run.sh` script to mount a directory containing your playbooks/repositories.    
Example: `CODE=${HOME}/code`  
```bash
# docker
./docker_run.sh
# lima
./lima_run.sh
```

#### Connect to the container with an interactive shell
```bash
# docker
./docker_connect.sh
# lima
./lima_connect.sh
```

#### Restart with new version
```bash
# docker
./docker_run.sh
# lima
./lima_run.sh
```

#### Shell alias (examples)
There are some example scripts in the exec directory that allow you to use tools from the container on your native shell with path translation.  

```bash
# Run
alias toolboxs='/<path to this repo>/toolbox/lima_run.sh'

# Connect
alias toolboxc='/<path to this repo>/toolbox/lima_connect.sh'

# Use Lima as Docker
alias docker='lima nerdctl $@'

# Make ansible-vault from the container available on native shell
alias ansible-vault='/<path to this repo>/exec/docker/ansible-vault.sh $@'

# Make ansible-playbook from the container available on native shell
alias ansible-playbook='/<path to this repo>/exec/docker/ansible-playbook.sh $@'

# Make ansible-lint from the container available on native shell
alias ansible-playbook='/<path to this repo>/exec/docker/ansible-lint.sh $@'

# Make azure cli from the container available on native shell
alias az='/<path to this repo>/exec/docker/az.sh $@'
```
