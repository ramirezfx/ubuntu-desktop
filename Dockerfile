ARG VER=latest
FROM ramirezfx/ubuntu-baseimage:$VER
ENV SHELL=/bin/bash

RUN apt update

# Intall Basic-Software and Software needed during installation
RUN apt-get install -y git cups wget

# Download latest nomachine-server
RUN wget -O /tmp/nomachine.deb "https://www.nomachine.com/free/linux/64/deb" && apt-get install -y /tmp/nomachine.deb

# ADD nxserver.sh
RUN wget -O /nxserver.sh https://github.com/ramirezfx/ubuntu-desktop/raw/main/nxserver.sh && chmod +x /nxserver.sh

# Custom Packages And Sripts:
# RUN wget -O /custom.sh https://github.com/ramirezfx/ubuntu-desktop/raw/main/custom.sh && chmod +x /custom.sh
# RUN /custom.sh

# Add Language-Support:
RUN wget -O /tmp/languages.txt https://github.com/ramirezfx/ubuntu-desktop/raw/main/languages.txt && xargs -a /tmp/languages.txt apt-get install -y
RUN rm -Rf /etc/localtime

ENTRYPOINT ["/nxserver.sh"]
