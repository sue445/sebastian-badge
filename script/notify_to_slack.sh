#!/bin/bash

NAME=$1
MESSAGE=$2

if [ -n "${SLACK_TOKEN}" ]; then
  curl https://slack.com/api/chat.postMessage -X POST -d 'channel=#sebastian' -d "text=${MESSAGE}" -d "username=${NAME}" -d "token=${SLACK_TOKEN}"
fi
