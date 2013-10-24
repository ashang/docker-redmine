#!/bin/sh
: ${RM_IMAGE?"need to set image name IMAGE, see README.md"}
: ${DB_USER?"need to set database username DB_USER, see README.md"}
: ${DB_PASS?"need to set database password DB_PASS, see README.md"}

: ${ROOT=/root}
: ${DB_ADAPTER=postgresql}
: ${DB_DATABASE=redmine}
: ${DB_HOST=172.17.42.1}
: ${RAILS_ENV=production}
: ${U_WORKERS=2}
: ${RM_PORT=3001}
: ${CMD=/bin/bash}
#: ${CMD="bundle exec unicorn_rails -c config/unicorn.rb"}
: ${RM_DIR=/redmine}
: ${OPTIONS="-i -t -w $RM_DIR -v $(pwd):$ROOT -p $RM_PORT:$RM_PORT -e RAILS_ENV=$RAILS_ENV -e U_WORKERS=$U_WORKERS -e DB_ADAPTER=$DB_ADAPTER -e DB_DATABASE=$DB_DATABASE -e DB_HOST=$DB_HOST -e DB_USER=$DB_USER -e DB_PASS=$DB_PASS"}
#: ${OPTIONS="-d -w $RM_DIR -v $(pwd):$ROOT -p $RM_PORT:$RM_PORT -e RAILS_ENV=$RAILS_ENV -e U_WORKERS=$U_WORKERS -e DB_ADAPTER=$DB_ADAPTER -e DB_DATABASE=$DB_DATABASE -e DB_HOST=$DB_HOST -e DB_USER=$DB_USER -e DB_PASS=$DB_PASS"}
: ${SUDO=""} # set to "sudo" if you are not in the docker group

$SUDO docker run $OPTIONS $RM_IMAGE $CMD

