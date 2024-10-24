#!/bin/bash
VAR_app="theApp"
VAR_conf="nginx.conf"
VAR_loc_3="../prt.3"
VAR_loc_4="../prt.4"
VAR_loc_conf="../prt.3/nginx"
VAR_img_name="docker_prt.4:1.0"

sudo docker rmi -f $VAR_img_name && \
cd $VAR_loc_3 && make rebuild && \
cp $VAR_app $VAR_loc_4/$VAR_app && \
make clear && cd $VAR_loc_4 && \
cp $VAR_loc_conf/$VAR_conf $VAR_conf && \
sudo docker build . -t $VAR_img_name 
rm -f $VAR_conf
rm -f $VAR_app
