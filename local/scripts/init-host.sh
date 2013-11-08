#!/bin/bash

if [ -e .env ]; then
  source .env
fi

: ${ROOT=/root/local}
: ${ROOT_FILES_DIR=$ROOT/files}
: ${ROOT_LOG_DIR=$ROOT/log}
: ${ROOT_DB_DIR=$ROOT/db}
: ${RM_DIR=/redmine}
: ${ROOT_SECRET_DIR=$ROOT/config/initializers}

mkdir -p $ROOT_FILES_DIR
mkdir -p $ROOT_LOG_DIR
mkdir -p $ROOT_DB_DIR
mkdir -p $ROOT_SECRET_DIR
cd $RM_DIR
if [ ! -e "$ROOT_SECRET_DIR/secret_token.rb" ]; then
  source /usr/local/share/chruby/chruby.sh
  chruby 2.0
  bundle exec rake generate_secret_token
fi
