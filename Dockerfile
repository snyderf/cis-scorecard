FROM buildpack-deps:jessie-scm
MAINTAINER VMware CNABU TEAM 7

RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/results

COPY kubectl /usr/local/bin/
COPY kubelet_score.sh /kubelet_score.sh

CMD ["/bin/bash", "-c", "/kubelet_score.sh"]
