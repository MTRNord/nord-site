FROM ubuntu:latest

RUN apt-get update && apt-get install -y git subversion python build-essential gawk unzip libncurses5-dev zlib1g-dev libssl-dev wget

RUN git clone https://github.com/freifunk-gluon/gluon /gluon && cd /gluon && git checkout v2016.2.2
RUN cd /gluon && git clone https://github.com/MTRNord/nord-site site && cd /gluon/site && git checkout ffslfl
RUN cp /gluon/site/build.sh /gluon/build.sh && chmod +x /gluon/build.sh

CMD "ls -la /gluon"
