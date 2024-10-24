#!/bin/bash

VAR_BOT_TOCKEN="<bot_tocken>"
VAR_BOT_ID="<dialogue_id>"
VAR_message_url="https://api.telegram.org/bot$VAR_BOT_TOCKEN/sendMessage"

if [ -z "$VAR_BOT_TOCKEN" ] || [ -z "$VAR_BOT_ID" ]; then
  echo "Telegram notifications impossible: telegram tocken or ID not set."
  exit 0
fi

echo "HELLO THERE!"

if [ "$CI_JOB_STAGE" == "pre-deploy" ]; then
    VAR_result="$CI_JOB_NAME: ⏲ - waits for manual start."
elif [ "$CI_JOB_STATUS" == "success" ]; then
    VAR_result="$CI_JOB_NAME: ✅ - succeed."
elif [ "$CI_JOB_STATUS" == "failed" ]; then
    VAR_result="$CI_JOB_NAME: ❎ - $CI_JOB_STATUS."
else
    VAR_result="$CI_JOB_NAME: 🛑 - canceled."
fi

curl -X POST -s -o /dev/null -d chat_id=$VAR_BOT_ID -d text="$VAR_result" $VAR_message_url

exit 0