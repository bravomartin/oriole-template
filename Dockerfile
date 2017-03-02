FROM jupyter/scipy-notebook:latest

# launchbot-specific labels
LABEL name.launchbot.io="Object Oriented Python"
LABEL workdir.launchbot.io="/usr/workdir"
LABEL description.launchbot.io="Object-oriented Python."
LABEL 8888.port.launchbot.io="Jupyter Notebook"
LABEL 8000.port.launchbot.io="Oriole"
LABEL 8008.port.launchbot.io="Oriole Editor"
LABEL 8009.port.launchbot.io="Atlas Settings Editor"

# Set the working directory
WORKDIR /usr/workdir

# Expose the notebook port
EXPOSE 8888
EXPOSE 8000

USER root

RUN apt-get update

RUN apt-get install -y nginx entr git

RUN rm -v /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx/

# Install Oriole Editor & Atlas Settings Editor
EXPOSE 8008
ADD oriole-linux /usr/local/bin/oriole-linux
RUN chmod +x /usr/local/bin/oriole-linux
EXPOSE 8009
ADD atlas-linux /usr/local/bin/atlas-linux
RUN chmod +x /usr/local/bin/atlas-linux

# Install and run the startup script
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

#USER jovyan

CMD ["/usr/local/bin/run.sh"]
