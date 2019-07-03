# Latest version of centos
FROM centos:centos7
MAINTAINER Asher Hsieh <fellow942111@gmail.com>
RUN yum clean all && \
    yum -y install epel-release wget

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.10.0/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN mkdir /etc/kubectl

# install ks
RUN wget -O /tmp/ks_0.13.1_linux_amd64.tar.gz https://github.com/ksonnet/ksonnet/releases/download/v0.13.1/ks_0.13.1_linux_amd64.tar.gz --no-check-certificate
RUN tar -xvf /tmp/ks_0.13.1_linux_amd64.tar.gz -C /etc/kubectl

WORKDIR /etc/kubectl

