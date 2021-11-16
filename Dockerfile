FROM ubuntu:rolling
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y \
  vlc \
  && rm -rf /var/lib/apt/lists/*
ENV HOME /home/vlc
RUN useradd --create-home --home-dir $HOME vlc \
	&& chown -R vlc:vlc $HOME \
	&& chown -R vlc:vlc /media \
	&& usermod -a -G audio,video vlc
USER vlc
ENTRYPOINT [ "cvlc" ]
