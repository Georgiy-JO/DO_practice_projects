#!/bin/bash
VAR_device_IP="10.255.255.5"
VAR_device_usr="user1"
VAR_device_bypass="sshpass -p '123'"
VAR_pass="123"

VAR_tmp_location="/home/user1"
VAR_dest_location="/usr/local/bin"

VAR_orig_location="artifacts"
VAR_cat="s21_cat"
VAR_grep="s21_grep"

sshpass -p $VAR_pass scp -o StrictHostKeyChecking=no $VAR_orig_location/$VAR_cat $VAR_orig_location/$VAR_grep \
    $VAR_device_usr@$VAR_device_IP:$VAR_tmp_location

if [ $? -ne 0 ]; then
  echo "ERROR: invalid transvering."
  exit 1
fi


sshpass -p '123' ssh -o StrictHostKeyChecking=no $VAR_device_usr@$VAR_device_IP "\
    mv $VAR_tmp_location/$VAR_cat $VAR_dest_location/$VAR_cat; \
    mv $VAR_tmp_location/$VAR_grep $VAR_dest_location/$VAR_grep"

if [ $? -ne 0 ]; then
  echo "ERROR: invalid moving."
  exit 1
fi


echo "Diployment is done."

exit 0
