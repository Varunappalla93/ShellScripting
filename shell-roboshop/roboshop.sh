#!/bin/bash

# aws cli command to create ec2 instance and get its details
aws ec2 run-instances \
    --image-id ami-xxxxxxxxxxxxxxxxx \
    --count 1 \
    --instance-type t2.micro \
    --key-name MyKeyPair \
    --security-group-ids sg-xxxxxxxxxxxxxxxxx \
    --subnet-id subnet-xxxxxxxxxxxxxxxxx \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=MyNewInstance}]'
