FROM ubuntu:trusty
RUN \
  apt-get update -y \
  && apt-get install -y --no-install-recommends \
    bash-completion \
    curl \
    g++ \
    git \
    software-properties-common \
    zlib1g-dev \
  && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
  && add-apt-repository ppa:webupd8team/java \
  && apt-get update -y \
  && apt-get install -y --no-install-recommends \
    oracle-java8-installer \
  && rm -rf /var/lib/apt/lists/* \
  ;
RUN \
  useradd travis -G sudo -m -s /bin/bash \
  && echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && visudo -c \
  ;
USER travis
RUN \
  gpg --keyserver keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB \
  && curl -sSL https://get.rvm.io | bash -s stable \
  ;
WORKDIR /home/travis
ADD setup.sh .
