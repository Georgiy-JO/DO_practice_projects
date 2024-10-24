#!/bin/bash
VAR_app="theApp"
VAR_loc_3="../prt.3"
VAR_loc_6="../prt.6"

if [ $1 -eq 1 ]
then
  echo "Cleaning old docker-compose conteiners.................."
  sudo docker-compose down

  echo "Creating theApp.................."
  cd $VAR_loc_3 && make rebuild && \
  cp $VAR_app $VAR_loc_6/$VAR_app && \
  make clear && cd $VAR_loc_6

  echo "Building containers.............."
  sudo docker-compose build && sudo docker-compose up -d

  echo "finishing........................"
  rm -f $VAR_app  
elif [ $1 -eq 2 ]
then
  echo "Checking ........................"
  sleep 1
  curl localhost:80
  curl localhost:80/status
elif [ $1 -eq 0 ]
then
  echo "Cleaning old docker-compose conteiners.................."
  sudo docker-compose down

  echo "Creating theApp.................."
  cd $VAR_loc_3 && make rebuild && \
  cp $VAR_app $VAR_loc_6/$VAR_app && \
  make clear && cd $VAR_loc_6

  echo "Building containers.............."
  sudo docker-compose build && sudo docker-compose up -d

  echo "finishing........................"
  rm -f $VAR_app  

  echo "Checking ........................"
  sleep 1
  curl localhost:80
  curl localhost:80/status
else
  echo Error input!
fi