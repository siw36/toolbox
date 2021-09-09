# ansible-development
Ansible container with various tools

The available Ansible version can be found here: https://pypi.org/project/ansible-core/#description

### Usage

#### Build
```bash
./build.sh
```

#### Run
Configure the variable `CODE` in the `run.sh` script to mount a directory containing your playbooks/repositories.    
Example: `CODE=${HOME}/Code`  
```bash
./run.sh
```

#### Connect
```bash
./connect.sh
```

#### Restart with new version
```bash
docker stop <container id>
./run.sh
```

#### Shell Alias (example)
```bash
# Run
alias ansibles='/<path to this repo>/ansible-development/run.sh'

# Connect
alias ansiblec='/<path to this repo>/ansible-development/connect.sh'
```
