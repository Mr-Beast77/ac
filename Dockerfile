FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive
ARG userid
ARG groupid
ARG username
RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
RUN apt-get update && apt-get install -y git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip python openjdk-7-jdk
RUN curl -o jdk8.tgz https://android.googlesource.com/platform/prebuilts/jdk/jdk8/+archive/master.tar.gz \
 && tar -zxf jdk8.tgz linux-x86 \
 && mv linux-x86 /usr/lib/jvm/java-8-openjdk-amd64 \
 && rm -rf jdk8.tgz
RUN curl -o /usr/local/bin/repo https://storage.googleapis.com/git-repo-downloads/repo-1 \
 #&& echo "d06f33115aea44e583c8669375b35aad397176a411de3461897444d247b6c220  /usr/local/bin/repo" | sha256sum --strict -c - \
 && chmod a+x /usr/local/bin/repo
RUN groupadd -g $groupid $username \
 && useradd -m -u $userid -g $groupid $username \
 && echo $username >/root/username \
 && echo "export USER="$username >>/home/$username/.gitconfig
COPY gitconfig /home/$username/.gitconfig
COPY entrypoint.sh /
RUN chown $userid:$groupid /home/$username/.gitconfig
ENV HOME=/home/$username
ENV USER=$username
ENV HOSTNAME ci
USER ci
ENTRYPOINT chroot --userspec=$(cat /root/username):$(cat /root/username) / /entrypoint.sh -i

