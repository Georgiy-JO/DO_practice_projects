FROM nginx:latest

# copy the config-file
COPY ./nginx.conf /etc/nginx/nginx.conf

# copy exe-file
COPY ./theApp /home/theApp

# install needed
RUN apt update && \
    apt install spawn-fcgi  -y && \
    apt-get install libfcgi-dev -y

CMD spawn-fcgi -p 8080 /home/theApp && nginx -g "daemon off;"