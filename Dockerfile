FROM ubuntu:16.04

RUN apt-get update -y \
    && apt-get install -y ruby ruby-dev gcc make \
    && gem install fluentd \
    && fluent-gem install fluent-plugin-elasticsearch

ENV GEM_HOME /root/.gem/ruby
ENV PATH /root/.gem/ruby/bin:$PATH

RUN fluentd -s conf
ENTRYPOINT [ "fluentd", "-c" ]
