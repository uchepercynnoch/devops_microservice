#!/bin/bash
cd ansible || exit 0
ansible-playbook -i inventory build-docker-images.yaml
ansible-playbook -i inventory deploy-docker-images.yaml
