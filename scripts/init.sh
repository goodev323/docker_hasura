#/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DCOKER_ROOT=$SCRIPT_DIR/../
cd $DCOKER_ROOT

ENV_FILE=$DCOKER_ROOT/.env.local
source $ENV_FILE

INIT_DIR=$DCOKER_ROOT/$HASURA_PROJECT_NAME
hasura metadata --project $INIT_DIR apply --endpoint $HASURA_ENDPOINT --admin-secret $HASURA_GRAPHQL_ADMIN_SECRET
hasura migrate --project $INIT_DIR apply --all-databases --endpoint $HASURA_ENDPOINT --admin-secret $HASURA_GRAPHQL_ADMIN_SECRET
hasura metadata --project $INIT_DIR reload --endpoint $HASURA_ENDPOINT --admin-secret $HASURA_GRAPHQL_ADMIN_SECRET
hasura seed apply --project $INIT_DIR --database-name default --file seeds.sql --endpoint $HASURA_ENDPOINT --admin-secret $HASURA_GRAPHQL_ADMIN_SECRET
hasura metadata reload --endpoint $HASURA_ENDPOINT --admin-secret $HASURA_GRAPHQL_ADMIN_SECRET
