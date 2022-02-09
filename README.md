# ansible-development
Ansible container with various tools

[![Docker Image CI](https://github.com/siw36/ansible-development/actions/workflows/docker-image.yml/badge.svg?branch=main)](https://github.com/siw36/ansible-development/actions/workflows/docker-image.yml)

The available Ansible version can be found here: https://pypi.org/project/ansible-core/#description

### Usage

Note that the following examples use Lima as local container management, since Docker is no longer free for professional usage. https://github.com/lima-vm/lima

#### Build
```bash
./lima_build.sh
```

#### Run
Configure the variable `CODE` in the `run.sh` script to mount a directory containing your playbooks/repositories.    
Example: `CODE=${HOME}/Code`  
```bash
./lima_run.sh
```

#### Connect
```bash
./lima_connect.sh
```

#### Restart with new version
```bash
./lima_run.sh
```

#### Shell Alias (example)
```bash
# Run
alias ansibles='/<path to this repo>/ansible-development/lima_run.sh'

# Connect
alias ansiblec='/<path to this repo>/ansible-development/lima_connect.sh'

# Use Lima as Docker
alias docker='lima nerdctl $@'

# Make ansible-vault from the container available on native shell
alias ansible-vault='/<path to this repo>/ansible-development/ansible-vault.sh $@'

# Make ansible-playbook from the container available on native shell
alias ansible-playbook='/<path to this repo>/ansible-development/ansible-playbook.sh $@'
```
