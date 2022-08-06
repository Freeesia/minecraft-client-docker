FROM ubuntu:20.04 AS base

EXPOSE 5900
ADD https://launcher.mojang.com/download/Minecraft.deb /tmp/
 
RUN apt-get update -q && \
    apt-get upgrade -yq && \
    apt-get install -yq --no-install-recommends \
    supervisor \
    xvfb \
    x11vnc \
    fluxbox \
    wget \
    libsecret-1-0 \
    default-jre \
    /tmp/Minecraft.deb && \
    rm -rf /var/lib/apt/lists/* &&\
    rm /tmp/Minecraft.deb && \
    useradd -m -U minecraft
 
COPY files /
 
VOLUME [ "/home/minecraft/.minecraft/" ]
 
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
 
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]


FROM base AS ja
RUN apt-get update -q && \
    apt-get install -yq --no-install-recommends locales &&\
    localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8 &&\
    apt-get install -yq --no-install-recommends fonts-ipafont &&\
    rm -rf /var/lib/apt/lists/*
