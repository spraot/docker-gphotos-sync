FROM gphotos-sync

RUN \
    # Install required packages
    apk --no-cache --update --upgrade add \
      bash \
      fluxbox \
      git \
      py3-numpy \
      supervisor \
      websockify \
      xvfb \
      x11vnc \
      && \
    # Install noVNC
    git clone --depth 1 https://github.com/novnc/noVNC.git /home/alpine/noVNC && \
    rm -rf /home/alpine/noVNC/.git && \
    apk del git && \
    # Create required directories and set permissions
    mkdir -p /tmp/.X11-unix && \
    chmod 1777 /tmp/.X11-unix && \
    # Cleanup any existing lock files
    rm -rf /tmp/.X* /tmp/.x*

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Setup environment variables
ENV HOME=/home/alpine \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]