#!/bin/bash

# Usage:
# ./gh_delete_deployments.sh <user> <repo> <env>

USER=$1
REPO=$2
ENV=$3

IDS=$(
    gh api -X GET /repos/${USER}/${REPO}/deployments?environment=${ENV} \
        | jq -r ".[].id"
)

for ID in $IDS; do
    echo "Deleting deployment $ID"
    gh api -X DELETE /repos/${USER}/${REPO}/deployments/$ID \
        | jq '.'
done
