FROM ubuntu:20.04

# Update current packages to the latest version
RUN apt-get update \
&& apt-get -y upgrade

# Install supporting packages then remove packages that are no longer requried
RUN apt-get install -y --no-install-recommends \
software-properties-common \
python3-pip \
curl \
rsync \
&& apt-get -y autoremove

# Install Ansible
RUN apt-get install -y ansible

# Install supporting packages for Linux with Ansible
RUN apt-get install -y sshpass \
&& ansible-galaxy collection install ansible.posix

# Install supporting packages for Windows with Ansible
RUN pip3 install pywinrm \
&& pip3 install pywinrm[credssp] \
&& ansible-galaxy collection install ansible.windows 

# Install supporting packages for Azure with Ansible
RUN curl -O https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt \
&& pip3 install -r requirements-azure.txt \
&& ansible-galaxy collection install azure.azcollection \
&& curl -sL https://aka.ms/InstallAzureCLIDeb | bash