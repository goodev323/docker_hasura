#!/bin/sh

if [ "$#" != 1 ]; then
    echo "Operation args required: start,stop,restart"
    exit 1;
fi

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

BASE_DIR=$SCRIPT_DIR/..
ENV_FILE=$BASE_DIR/.env.local
DOCKER_FILE=$BASE_DIR/docker-compose.yaml
source $ENV_FILE

case "$1" in
    start )
        docker-compose -f $DOCKER_FILE --env-file $ENV_FILE up -d
        echo Access to $HASURA_ENDPOINT
    ;;
    
    stop )
        docker-compose -f $DOCKER_FILE --env-file $ENV_FILE stop
    ;;
    
    restart )
        docker-compose -f $DOCKER_FILE --env-file $ENV_FILE stop
        docker-compose -f $DOCKER_FILE --env-file $ENV_FILE up -d
        echo Access to $HASURA_ENDPOINT
    ;;
    
    * )
        echo "Operation args required: start,stop,restart"
    ;;
esac