FROM centos:7
ENV phabhash master
ENV archash master
ENV libhash master
ENV TMPDIR /tmp
RUN yum -y install \
    bash \
    git \
    hg \
    php \
    which
WORKDIR /root
RUN git clone https://github.com/phacility/libphutil \
      && cd libphutil \
      && git checkout ${libhash} \
      && cd /root
RUN git clone https://github.com/phacility/arcanist \
      && cd arcanist \
      && git checkout ${archash} \
      && cd /root
RUN hg clone https://hg.mozilla.org/automation/phabricator-qa-stage 
RUN hg clone https://hg.mozilla.org/automation/phabricator-qa-dev
RUN echo "alias arc='/root/arcanist/bin/arc'" >> /etc/profile.d/arc.sh
RUN printf "echo \"Don\'t forget to run \'arc install-certificate\' in each hg cloned repo\"" >> /etc/profile.d/cert_remind.sh
COPY checkout.sh .
ENTRYPOINT [ "/root/checkout.sh" ]
