FROM centos:7
ARG http_proxy
ARG https_proxy

RUN yum update -y && yum install wget automake make g++ gcc which nano man -y && wget http://downloads.sourceforge.net/project/cntlm/cntlm/cntlm%200.92.3/cntlm-0.92.3.tar.gz \
    && tar -xvf cntlm-0.92.3.tar.gz && cd cntlm-0.92.3 && ./configure && make && make install && cp /etc/cntlm.conf /etc/cntlm.conf.bk

WORKDIR /root
COPY cntlm.conf /etc/cntlm.conf
COPY setup_cntlm.sh /root/setup_cntlm.sh
ENTRYPOINT bash
