# Install ldap-server
#
# VERSION 0.1.0

FROM ubuntu:14.04
MAINTAINER Matt Voss "voss.matthew@gmail.com"
WORKDIR /data/ldap-server

# Install dependencies for nginx installation
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y && apt-get clean

RUN apt-get install -y wget curl unzip build-essential checkinstall zlib1g-dev libyaml-dev libssl-dev telnet less \
    libgdbm-dev libreadline-dev libncurses5-dev libffi-dev iputils-ping iputils-tracepath rsyslog supervisor \
    python-software-properties sendmail python g++ make software-properties-common rlwrap git-core wget vim && \
    apt-get clean && \
    add-apt-repository -y ppa:chris-lea/node.js && apt-get update && apt-get upgrade -y && apt-get clean && \
    apt-get install -y nodejs

#RUN dpkg-divert --local --rename --add /sbin/initctl && \
#    ln -s /bin/true /sbin/initctl

RUN echo "*.* @172.17.42.1:514" >> /etc/rsyslog.d/90-networking.conf

# Clone
RUN git clone --verbose https://github.com/mattvoss/ldap-server.git /data/ldap-server && \
    ls -al /data/ldap-server

# Add custom settings.json to /data/ldap-server
ADD settings.json /data/ldap-server/config/settings.json
ADD supervisor-ldap-server.conf /etc/supervisor/conf.d/
ADD supervisor-rsyslogd.conf /etc/supervisor/conf.d/

# Install ldap-server with NPM
RUN cd /data/ldap-server && npm install

ADD install.sh /data/install.sh
RUN chmod +x /data/install.sh
ADD run.sh /data/run.sh
RUN chmod +x /data/run.sh

# Volumes

# Expose port 389
EXPOSE 389

# Run Supervisord
CMD ["/data/run.sh"]
