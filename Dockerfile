FROM troykinsella/concourse-ansible-playbook-resource:2.0.0 as base
LABEL maintainer="Tomas Trnka <tt@tomastrnka.net>"
RUN apt-get update

FROM base AS tools
COPY requirements.txt /requirements.txt
RUN pip3 install -r requirements.txt