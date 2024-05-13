FROM ghcr.io/msojocs/appimagebuild:centos7-x86_64

USER root
RUN yum install -y fuse