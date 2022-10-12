FROM docker.io/library/ubuntu:focal

ARG USER_ID USER_NAME GROUP_ID BULD_DATE ANSIBLE_VERSION ARCHITECTURE
ENV DEBIAN_FRONTEND=noninteractive
ENV ARCHITECTURE=$ARCHITECTURE

LABEL maintainer="rhh.klussmann@gmail.com"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="toolbox"
LABEL org.label-schema.description="DevOps toolbox container"
LABEL org.label-schema.vcs-url="https://github.com/siw36/toolbox"

USER 0

WORKDIR /tmp

# Build cache and upgrade OS
RUN apt update && \
  apt upgrade -y

# Install repo packages
RUN apt update && \
  apt install -y \
  wget \
  ca-certificates \
  apt-transport-https \
  lsb-release \
  gnupg \
  curl \
  jq \
  python3.8 \
  python3-pip \
  mysql-client \
  ssh \
  vim \
  tar \
  gzip \
  openjdk-11-jre-headless \
  git \
  rsync \
  iputils-ping \
  dnsutils

# Use python3.8 as default
RUN ln -s /usr/bin/python3.8 /usr/bin/python

# Install mongo shell
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add - && \
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list && \
  apt-get update && \
  apt-get install -y mongodb-org-shell

# Install openshift cli
RUN wget -q https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz -P /tmp/ && \
  tar -xzf /tmp/openshift-client-linux.tar.gz -C /usr/bin/ && \
  rm -rf /tmp/openshift-client-linux.tar.gz

# Install velero cli
RUN wget -q https://github.com/vmware-tanzu/velero/releases/download/v1.9.2/velero-v1.9.2-linux-${ARCHITECTURE}.tar.gz -P /tmp/ && \
  tar -xzf /tmp/velero-v1.9.2-linux-${ARCHITECTURE}.tar.gz -C /tmp/ && \
  mv /tmp/velero-v1.9.2-linux-${ARCHITECTURE}/velero /usr/bin/velero && \
  rm -rf /tmp/velero-v1.9.2-linux-${ARCHITECTURE}.tar.gz /tmp/velero-v1.9.2-linux-${ARCHITECTURE}

# Install azure cli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Prepare user and home directory
RUN groupadd -r -g ${USER_ID} ${USER_NAME} && \
  useradd -l -u ${USER_ID} -g ${USER_ID} -s /bin/bash ${USER_NAME}

# bashrc
COPY .bashrc /home/${USER_NAME}/.bashrc
RUN chown -R ${USER_ID}:${USER_ID} /home/${USER_NAME} && \
  chmod 600 /home/${USER_NAME}/.bashrc

# Switch to current user
USER $USER_ID
ENV HOME=/home/$USER_NAME \
  PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/${USER_NAME}/.local/bin:/var/ansible/bin

WORKDIR /home/$USER_NAME

# Prepare SSH directory
RUN mkdir -p /home/$USER_NAME/.ssh && \
  chown $USER_ID:$USER_ID /home/$USER_NAME/.ssh && \
  chmod 700 /home/$USER_NAME/.ssh

# Install pip packages
COPY requirements.txt .
RUN pip install -r requirements.txt

# Install Ansible collections
COPY requirements.yml .
RUN ansible-galaxy install -r requirements.yml

# Install azure collection requirements
RUN pip install -r /home/$USER_NAME/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt

#COPY ansible.cfg .

ENTRYPOINT ["sleep", "infinity"]
