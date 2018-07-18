FROM alpine:edge
RUN apk --no-cache --update add \
  bash \
  curl \
  git \
  gnupg \
  perl \
  procps \
  shadow \
  sudo \
  tar \
  ;
RUN \
  useradd travis -G wheel -m -s /bin/bash --key MAIL_DIR=/dev/null \
  && echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && visudo -c \
  ;
USER travis
RUN \
  gpg --keyserver keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB \
  && curl -sSL https://get.rvm.io | bash -s stable \
  ;
WORKDIR /home/travis
ADD setup.sh .
