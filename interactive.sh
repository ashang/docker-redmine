#!/bin/sh
: ${RM_IMAGE?"need to set image name IMAGE, see README.md"}
: ${DB_USER?"need to set database username DB_USER, see README.md"}
: ${DB_PASS?"need to set database password DB_PASS, see README.md"}

: ${ROOT=/root}
: ${RAILS_ENV=development}
: ${RM_PORT=3000}
: ${CMD=/bin/bash}
: ${RM_DIR=/redmine}
: ${OPTIONS="-i -t -w $RM_DIR -v $(pwd):$ROOT -p $RM_PORT:3000 -e HOME=$ROOT -e RAILS_ENV=$RAILS_ENV -e DB_ADAPTER=$DB_ADAPTER -e DB_DATABASE=$DB_DATABASE -e DB_HOST=$DB_HOST -e DB_USER=$DB_USER -e DB_PASS=$DB_PASS"}
: ${SUDO=""} # set to "sudo" if you are not in the docker group

$SUDO docker run $OPTIONS $IMAGE $CMD
