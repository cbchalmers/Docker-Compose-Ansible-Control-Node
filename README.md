# Project Details

## Title

Dockercompose to create an Ansible Control Node with supporting packages to manage Linux and Windows servers

## Description

Templated Dockercompose file to create an image which can be used as an Ansible Control Node supporting Linux and Windows servers. Linux requirements included for password based authentication. Windows requirements included for WinRM using CredSSP authentication. Additionally, there are also packages enabling Azure to be used as a dynamic inventory.

#### Image Contents

* Ubuntu 20.04 LTS
* Ansible 2.9
* sshpass for password authentication with Linux hosts
* pywinrm and pywinrm[credssp] for password authentication with Windows hosts
* Ansible Collection for common Windows modules (eg community.windows.win_iis_webapplication)
* Ansible Collection for common Azure modules (eg dynamic inventory)
* Azure CLI (dependency for Azure dynamic inventory)

### Prerequisites

* [Docker Desktop](https://www.docker.com/products/docker-desktop)

### Building

To build this Docker image you can do the following from within the cloned folder -

```
docker build --no-cache -t local/ansible-control-node:latest .
```

### Running

To create a container from the image you created run the following -

```
docker container run --name ansible-control-node -dit local/ansible-control-node:latest
```

Alternatively, to mount a volume into the container which contains your code add in the -v argument. Replace C:\Users\cbchalmers\Code with the local folder to mount -

```
docker container run --name ansible-control-node -dit -v C:\Users\cbchalmers\Code:/mnt/code local/ansible-control-node:latest
```

To access your container run the following -

```
docker exec -it ansible-control-node /bin/bash
```

## References

* [Docker Build](https://docs.docker.com/engine/reference/commandline/build/)
* [Docker Run](https://docs.docker.com/engine/reference/commandline/run/)

## Authors

Chris Chalmers - [LinkedIn](https://uk.linkedin.com/in/chris-chalmers), [Azure DevOps](https://dev.azure.com/cbchalmers/Personal%20Development), [GitHub](https://github.com/cbchalmers)