FROM nvidia/opengl:1.2-glvnd-devel

ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=ja_JP.UTF-8 \
    LC_ALL=${LANG} \
    LANGUAGE=${LANG} \
    TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone &&\
    apt update && \
    apt install -y \
    supervisor \
    xvfb \
    xfce4 \
    x11vnc \
    wget \
    curl \
    net-tools \
    vim-tiny \
    xfce4-terminal \
    apt-utils \
    language-pack-ja-base language-pack-ja \
    ibus-anthy \
    fonts-takao \
    && \
    echo ja_JP.UTF-8 UTF-8 >> /etc/locale.gen && \
    dpkg-reconfigure locales &&\
    mkdir -p /opt/noVNC/utils/websockify && \
    wget -qO- "http://github.com/novnc/noVNC/tarball/master" | tar -zx --strip-components=1 -C /opt/noVNC && \
    wget -qO- "https://github.com/novnc/websockify/tarball/master" | tar -zx --strip-components=1 -C /opt/noVNC/utils/websockify && \
    ln -s /opt/noVNC/vnc.html /opt/noVNC/index.html &&\
    LANG=C xdg-user-dirs-update --force

EXPOSE 8080
COPY files /
# ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

RUN apt install -y \
    firefox \
    mesa-utils \
    gdebi-core \
    glmark2 &&\
    wget https://phoronix-test-suite.com/releases/repo/pts.debian/files/phoronix-test-suite_10.8.4_all.deb && \
    gdebi -y phoronix-test-suite_10.8.4_all.deb
ENV NVIDIA_DRIVER_CAPABILITIES=all \
    NVIDIA_VISIBLE_DEVICES=all