# https://docs.bazel.build/versions/master/install-ubuntu.html#using-bazel-custom-apt-repository
FROM openjdk:8
# https://docs.bazel.build/versions/master/install-ubuntu.html#step-1-install-required-packages
RUN \
  apt-get update -y \
  && apt-get install -y --no-install-recommends \
    g++ \
  && rm -rf /var/lib/apt/lists/* \
  ;
# https://docs.bazel.build/versions/master/install-ubuntu.html#step-2-download-bazel
ARG bazel=0.9.0
RUN \
  curl -sfL -o file.sh https://github.com/bazelbuild/bazel/releases/download/${bazel}/bazel-${bazel}-installer-linux-x86_64.sh \
  && chmod +x file.sh \
  && ./file.sh --user \
  && rm file.sh \
  ;
# https://docs.bazel.build/versions/master/install-ubuntu.html#step-4-set-up-your-environment
ENV PATH=$PATH:/root/bin
