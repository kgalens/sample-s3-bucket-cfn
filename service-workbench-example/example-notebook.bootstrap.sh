#!/bin/bash

# Example bootstrap script for initiliazing a Sagemaker notebook instance.

# Install dependencies required for the Seurat notebook.
# Should be run as ec2-user, not root.

# Initialize conda. I'm not sure if this happens appropriately.
source ~/.bashrc

envname="R"

# Activate the environment and install necessary packages
conda install -n $envname -y r-essentials r-base r-botor r-tidyverse

touch /home/ec2-user/SageMaker/RNASeqBulkReady