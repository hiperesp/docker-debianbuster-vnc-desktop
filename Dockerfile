FROM debian:buster-20230522 AS system

# Install the essential packages + UI + VNC
RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y xfce4 xfce4-terminal dbus-x11
RUN apt-get install -y x11vnc xvfb novnc websockify
RUN apt-get install -y net-tools

# Install applications
RUN apt-get update
RUN apt-get install -y nano
RUN apt-get install -y firefox-esr

# Copy the startup script
COPY scripts /usr/local/bin/scripts
RUN chmod -R +x /usr/local/bin/scripts

EXPOSE 5900 6080

CMD ["/usr/local/bin/scripts/setup.sh"]
