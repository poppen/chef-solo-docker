FROM phusion/baseimage:0.9.9
MAINTAINER MATSHI Shinsuke <poppen.jp@gmail.com>

ENV HOME /root

ENV CHEFHOME /chef-repo
ADD /chef-repo /chef-repo

RUN apt-get update

RUN curl -L http://www.opscode.com/chef/install.sh | bash
RUN cd ${CHEFHOME} && chef-solo -c ${CHEFHOME}/solo.rb -j ${CHEFHOME}/nodes/docker.json

ADD https://github.com/poppen.keys /tmp/poppen_key
RUN cat /tmp/poppen_key >> /root/.ssh/authorized_keys && rm -f /tmp/poppen_key

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22
CMD ["/sbin/my_init"]
