#!/bin/sh

ssh-keyscan $SSH_HOST >> ~/.ssh/known_hosts

echo "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GatewayPorts=true -p $SSH_PORT -N -L $LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT $SSH_USER@$SSH_HOST"
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GatewayPorts=true -p $SSH_PORT -N -L $LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT $SSH_USER@$SSH_HOST
