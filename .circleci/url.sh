#! /bin/bash
echo $1
aws ec2 describe-instances --filters "Name=tag:Name,Values=backend-$1" --query 'Reservations[*].Instances[*].PublicIpAddress' --output text >> ~/project/.circleci/ansible/inventory.txt

