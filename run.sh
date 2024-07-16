#! /bin/sh

set -e

TAG=2.6
COMPOSE_FILE=docker-compose.yml

for arg
do
    case "$arg" in
        --rebuild)
            docker compose -f $COMPOSE_FILE rm app
            docker compose -f $COMPOSE_FILE build
            shift
            ;;
        --down)
            docker compose -f $COMPOSE_FILE down
            exit 0
            shift
            ;;
        --app)
            docker compose -f $COMPOSE_FILE run -p 3000:3000 --rm app bash
            exit 0
            shift
            ;;
        --web)
            docker compose -f $COMPOSE_FILE run --rm app bash
            exit 0
            shift
            ;;
     esac
done
