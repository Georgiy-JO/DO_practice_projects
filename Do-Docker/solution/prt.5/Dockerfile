FROM ubuntu:24.04

# install needed
RUN apt update && \
    apt install spawn-fcgi  -y && \
    apt-get install libfcgi-dev -y && \
    apt install nginx -y && \
    apt install curl -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# adding user and needed rights for them (usermod -aG sudo georgy_jo  - is not safe)
RUN useradd -ms /bin/bash georgy_jo && \
    chown -R georgy_jo:georgy_jo /var && \
    chown -R georgy_jo:georgy_jo /usr/bin && \
    chown -R georgy_jo:georgy_jo /usr/sbin  && \
    chown -R georgy_jo:georgy_jo /run

# setting a user to work with    
USER georgy_jo

# copy the config-file
COPY ./nginx.conf /etc/nginx/nginx.conf

# copy exe-file
COPY ./theApp /home/theApp

# do during any container built
CMD spawn-fcgi -p 8080 /home/theApp && nginx -g "daemon off;"

# checking 
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:80 || exit 1