# .bashrc

# Info
echo "### ANSIBLE DEVELOPMENT CONTAINER"
echo "https://github.com/siw36/toolbox"
echo "### USAGE"
echo "Your code is mounted at /home/$(whoami)/code"
echo "Your SSH keys are mounted at /home/$(whoami)/.ssh"
echo "You can exit this shell with Ctrl+D"
echo "Have Fun!"

# SSH agent
eval `ssh-agent`
