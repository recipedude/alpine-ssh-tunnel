# SSH Tunnel on Docker

This repo contains a docker, runtime configurable, SSH tunnel based on the lightweight Alpine image.

## Why

Why yet another alpine-ssh-tunnel docker image?

The other alpine-ssh-tunnel images, at least that I found, in the wild do not allow for easy specification of the bastion host SSH port.   The standard port 22 suffers from a non-stop firehose of probes and root login attempts from bad actors. Therefore I will routinely move the SSH port to another random port in nearly every deployment.   

YMMV.

## Build

```docker build -t recipedude/alpine-ssh-tunnel:latest .```

## Usage

Create a ```config.env``` file to set the following environment variables:

- ```REMOTE_HOST``` - the remote host on the other side of the bastion host 
- ```REMOTE_PORT``` - the port on the remote host that will be forwarded
- ```LOCAL_PORT``` - the local port on the docker container, 
- ```SSH_USER``` - username of the SSH user on the bastion host
- ```SSH_HOST``` - the bastion host that you will be tunneling through
- ```SSH_PORT``` - the bastion host that you will be tunneling through

Example config.env:
```
REMOTE_HOST=db.internal.domain
REMOTE_PORT=3306
LOCAL_PORT=3307
SSH_USER=tunnel
SSH_HOST=fw.domain.com
SSH_PORT=22
```

Run the container with: 

```docker run -d -p <LOCALHOST_PORT>:<LOCAL_PORT> --env-file config.env -v ~/.ssh:/root/.ssh:ro --name=ssh-tunnel recipedude/alpine-ssh-tunnel```

