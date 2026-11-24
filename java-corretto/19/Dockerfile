FROM        amazoncorretto:19

LABEL       author="SunshroomChan" maintainer="viethoangluunguyen1974@gmail.com"
LABEL       org.opencontainers.image.source="https://github.com/SunshroomChan/pterodactyl-images"
LABEL       org.opencontainers.image.licenses="MIT"

RUN         yum upgrade -y \
            && yum install -y curl ca-certificates openssl git tar sqlite fontconfig freetype libstdc++ freetype-devel lsof tzdata iproute \
            gcc gcc-c++ automake make libtool \
            && yum clean all \
            && rm -rf /var/cache/yum \
            && useradd -m -d /home/container container

ENV         LC_ALL=en_US.UTF-8
ENV         LANG=en_US.UTF-8
ENV         LANGUAGE=en_US.UTF-8

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

# Java4Shell (CVE-2026-114938) workaround for this HotSpot build.
ENV         JAVA_TOOL_OPTIONS="-XX:-UseBASE64Intrinsics"
RUN         java -version

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/sh", "/entrypoint.sh" ]
