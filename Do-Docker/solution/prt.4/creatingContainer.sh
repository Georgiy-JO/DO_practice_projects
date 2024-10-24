#!/bin/bash
VAR_loc_loc_conf="../prt.3/nginx/nginx.conf"
VAR_dis_loc_conf="/etc/nginx/nginx.conf"
VAR_cont_name="child_4"
VAR_img_name="docker_prt.4:1.0"
VAR_ABS_PATH=$(readlink -f .)

sudo docker run -d -p 80:81 --name $VAR_cont_name -v $VAR_ABS_PATH/$VAR_loc_loc_conf:$VAR_dis_loc_conf $VAR_img_name