#!/bin/bash
VAR_app="theApp"
VAR_conf="nginx.conf"
VAR_loc_3="../prt.3"
VAR_loc_4="../prt.5"
VAR_loc_conf="./nginx"
VAR_img_name="docker_prt.5:2.0"

if [ $1 -eq 1 ]
then
  export DOCKER_CONTENT_TRUST=1
  echo "Building image..."
  sudo docker rmi -f $VAR_img_name
  cd $VAR_loc_3 && make rebuild && \
  cp $VAR_app $VAR_loc_4/$VAR_app && \
  make clear && cd $VAR_loc_4
  cp $VAR_loc_conf/$VAR_conf $VAR_conf
  sudo docker build . -t $VAR_img_name 
  rm -f $VAR_conf
  rm -f $VAR_app  
elif [ $1 -eq 2 ]
then
  echo "Checking the image..."
  sudo dockle $VAR_img_name
elif [ $1 -eq 0 ]
then
  export DOCKER_CONTENT_TRUST=1
  echo "Building image..."
  sudo docker rmi -f $VAR_img_name
  cd $VAR_loc_3 && make rebuild && \
  cp $VAR_app $VAR_loc_4/$VAR_app && \
  make clear && cd $VAR_loc_4
  cp $VAR_loc_conf/$VAR_conf $VAR_conf
  sudo docker build . -t $VAR_img_name 
  rm -f $VAR_conf
  rm -f $VAR_app 
  echo "Checking the image..."
  sudo dockle $VAR_img_name
else
  echo ERROR command
fi
