FROM gphotos-sync

# Setup environment variables
ENV HOME=/home/abc \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    XDG_CONFIG_HOME=/tmp/.chromium \
    XDG_CACHE_HOME=/tmp/.chromium

RUN \
    # Install required packages
    apk --no-cache --update --upgrade add \
      bash \
      faenza-icon-theme \
      git \
      nodejs \
      npm \
      py3-numpy \
      shadow \
      supervisor \
      tigervnc \
      websockify \
      wget \
      xfce4 \
      xfce4-terminal \
      && \
    # Create a non-root user
    addgroup -g 1000 abc && \
    adduser -g 1000 -h $HOME -s /bin/bash -S -D abc && echo -e "abc\nabc" | passwd abc && \
    echo 'abc ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    # Install noVNC
    git clone --depth 1 https://github.com/novnc/noVNC.git /opt/noVNC && \
    npm install --prefix /opt/noVNC && \
    rm -rf /opt/noVNC/.git && \
    apk del git && \
    wget https://raw.githubusercontent.com/novaspirit/Alpine_xfce4_noVNC/dev/vnc.html -O /opt/noVNC/vnc.html && \
    # Create required directories and set permissions
    mkdir -p /tmp/.X11-unix && \
    chmod 1777 /tmp/.X11-unix && \
    # Cleanup any existing lock files
    rm -rf /tmp/.X* /tmp/.x*

RUN mkdir -p $HOME/.vnc \
    && echo -e "-Securitytypes=none" > $HOME/.vnc/config \
    && echo -e "#!/bin/bash\nstartxfce4 &" > $HOME/.vnc/xstartup \
    && echo -e "abcabc\nabcabc\nn\n" | vncpasswd \
    && chown -R abc $HOME

COPY root/ /