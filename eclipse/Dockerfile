FROM ubuntu:14.04
MAINTAINER Joe Sørensen <joe.sorensen@gmail.com>

LABEL Description="This image is used to start eclipse" Vendor="flug.dk" Version="1.0"

RUN apt-get update && apt-get install -y wget openjdk-7-jdk

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer


# Download eclipse
RUN mkdir -p /home/developer/opt
ADD http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/mars/R/eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz /home/developer/opt/

RUN tar -xzvf /home/developer/opt/* -C /home/developer/opt/
RUN chown developer: -R /home/developer/opt

USER developer
ENV HOME /home/developer
ENV DISPLAY :0

CMD /home/developer/opt/eclipse/eclipse
