#!/bin/bash

STACKNAME="TestCICDPipeline"
ACTION=$1

if [ $ACTION == 'delete' ]; then
    aws cloudformation delete-stack --stack-name $STACKNAME
fi


if [[ $ACTION == 'deploy' ]]; then
    aws cloudformation deploy --template-file cfn-s3-bucket-pipeline.yml --stack-name 'TestCICDPipeline' --capabilities CAPABILITY_IAM    
fi


