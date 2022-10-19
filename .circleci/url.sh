#! /bin/bash

echo $(aws ec2 describe-instances --filters "Name=tag:Name,Values=backend-$1" --query 'Reservations[*].Instances[*].PublicIpAddress' --output text) >> /home/circleci/project/.circleci/ansible/inventory.txt

