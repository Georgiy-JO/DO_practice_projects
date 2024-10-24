#!/bin/bash
VAR_loc_loc_conf="./nginx/nginx.conf"
VAR_dis_loc_conf="/etc/nginx/nginx.conf"
VAR_cont_name="child_5"
VAR_img_name="docker_prt.5:2.0"
# VAR_ABS_PATH=$(readlink -f .)

# docker rm $VAR_cont_name && \
sudo docker run -d -p 80:81 --name $VAR_cont_name -v $VAR_loc_loc_conf:$VAR_dis_loc_conf $VAR_img_name