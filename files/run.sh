#!/bin/bash

fn_setvars () {
  if [ ! -z $DB_TYPE ]
    then sed -i -e "s/mysql/$DB_TYPE/g" /opt/mattermost/config/config.json
  fi

  if [ ! -z $DB_USER ]
    then sed -i -e "s/mmuser/$DB_USER/g" /opt/mattermost/config/config.json
  fi

  if [ ! -z $DB_USER_PASSWD ]
    then sed -i -e "s/:mostest/:$DB_USER_PASSWD/g" /opt/mattermost/config/config.json
  else sed -i -e "s/:mostest//g" /opt/mattermost/config/config.json
  fi

  if [ ! -z $DB_HOST ]
    then sed -i -e "s/dockerhost/$DB_HOST/g" /opt/mattermost/config/config.json
  else sed -i -e "s/dockerhost/localhost/g" /opt/mattermost/config/config.json
  fi

  if [ ! -z $DB_NAME ]
    then sed -i -e "s/mattermost_test/$DB_NAME/g" /opt/mattermost/config/config.json
  else sed -i -e "s/mattermost_test/mattermost/g" /opt/mattermost/config/config.json
  fi
}

fn_setvars
cd /opt/mattermost/bin/ && ./platform
