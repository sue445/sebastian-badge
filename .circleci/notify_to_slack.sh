#!/bin/bash

NAME=$1
MESSAGE=$2

curl https://slack.com/api/chat.postMessage -X POST -d 'channel=#sebastian' -d "text=${MESSAGE}" -d "username=${NAME}" -d "token=${SLACK_TOKEN}"
