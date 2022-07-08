#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)
DCOKER_ROOT=$SCRIPT_DIR/../
cd $DCOKER_ROOT

ENV_FILE=$DCOKER_ROOT/.env.local
source $ENV_FILE

INIT_DIR=$DCOKER_ROOT/$HASURA_PROJECT_NAME

hasura $1 --project $INIT_DIR --endpoint $HASURA_ENDPOINT --admin-secret $HASURA_GRAPHQL_ADMIN_SECRET $2