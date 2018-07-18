FROM ruby:2.3.4
RUN apt-get update -y \
  && apt-get install --no-install-recommends -y \
    sudo \
    unzip \
  && rm -rf /var/lib/apt/lists/* \
  && gem install --no-rdoc --no-ri \
    bundler \
    travis \
  && travis version \
  ;
ARG travis=master
RUN curl -sfL -o file.zip https://github.com/travis-ci/travis-build/archive/${travis}.zip \
  && unzip -qq file.zip -d ~/.travis \
  && rm file.zip \
  && (cd ~/.travis \
    && mv travis-build-* travis-build \
  ) \
  && (cd ~/.travis/travis-build \
    && bundle install \
    && bundler binstubs travis \
  ) \
  ;
WORKDIR /data
ENTRYPOINT ["travis", "compile", "--skip-version-check", "--skip-completion-check"]
