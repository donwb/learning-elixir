FROM ubuntu
MAINTAINER Don Browning

RUN touch /etc/init.d/couchdb
RUN apt-get update && apt-get install -y wget
RUN cd /opt && wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update && apt-get install -y elixir

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /opt/learning