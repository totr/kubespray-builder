FROM troykinsella/concourse-ansible-playbook-resource:2.0.0 as base
LABEL maintainer="Tomas Trnka <tt@tomastrnka.net>"
RUN apt-get update -y
RUN apt-get install -y jq apache2-utils git-crypt

FROM base AS tools
COPY requirements.txt /requirements.txt
RUN pip3 install -r requirements.txt \
    && wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.12.4/kubeseal-linux-amd64 -O kubeseal \
    && install -m 755 kubeseal /usr/local/bin/kubeseal \
    && wget https://github.com/mikefarah/yq/releases/download/3.2.1/yq_linux_amd64 -O yq \
    && install -m 755 yq /usr/local/bin/yq \
    && wget https://storage.googleapis.com/kubernetes-release/release/v1.18.5/bin/linux/amd64/kubectl -O kubectl \
    && install -m 755 kubectl /usr/local/bin/kubectl