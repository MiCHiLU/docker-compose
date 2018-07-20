# https://docs.bazel.build/versions/master/install-ubuntu.html#using-bazel-custom-apt-repository
FROM openjdk:8
# https://docs.bazel.build/versions/master/install-ubuntu.html#step-1-install-required-packages
RUN \
  apt-get update -y \
  && apt-get install -y --no-install-recommends \
    bash-completion \
    g++ \
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/* \
  ;
# https://docs.bazel.build/versions/master/install-ubuntu.html#step-2-download-bazel
ARG bazel=0.9.0
#RUN \
#  curl -sfL -o file.sh https://github.com/bazelbuild/bazel/releases/download/${bazel}/bazel-${bazel}-installer-linux-x86_64.sh \
#  && chmod +x file.sh \
#  && ./file.sh --user \
#  && rm file.sh \
#  ;
RUN \
  curl -sfL -o file.deb https://github.com/bazelbuild/bazel/releases/download/${bazel}/bazel_${bazel}-linux-x86_64.deb \
  && dpkg -i file.deb \
  && rm file.deb \
  ;
# https://docs.bazel.build/versions/master/install-ubuntu.html#step-4-set-up-your-environment
ENV PATH=$PATH:/root/bin
