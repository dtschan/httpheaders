FROM openshift/base-centos7
MAINTAINER Daniel Tschan <tschan@puzzle.ch>

RUN yum install -y golang-bin && yum clean all
ADD . ${HOME}/gocode/src/github.com/dtschan/httpheaders
RUN GOCODE=${HOME}/gocode && cd ${HOME}/gocode/src/github.com/dtschan/httpheaders && go install ./...

USER 1001

EXPOSE 8080

CMD ${HOME}/gocode/bin/httpheaders
