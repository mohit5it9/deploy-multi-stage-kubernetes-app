# This script provisions a GKE cluster
#! /bin/bash -e

# check if the cluster already exists
response=$(gcloud container clusters describe $1 --zone=$2 || echo "ClusterNotFound")

if [[ $response = "ClusterNotFound" ]]
then
  echo "Creating cluster "$1
  gcloud container clusters create $1 --num-nodes=1 --machine-type=n1-standard-1 --zone=$2
else
  echo "Cluster "$1" already exists"
fi
