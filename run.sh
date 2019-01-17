#!/bin/sh

docker run -d -p 3306:3307 --env-file config.env -v ~/.ssh:/root/.ssh:ro --name=ssh-tunnel recipedude/alpine-ssh-tunnel