ARG BUILD_FROM
FROM $BUILD_FROM

ENV DISABLE_JEMALLOC=yes
LABEL maintainer="Redacid redacid@ios.in.ua"
#aarch64-base:3.13
#RUN apk add --no-cache \
#        mpc=0.33-r2 \
#        mpd=0.22.3-r0 \
#        ympd=1.3.0-r9

#aarch64-base:3.18
RUN apk add --no-cache \
        mpc=0.34-r0 \
        mpd=0.23.13-r0 \
        ympd=1.3.0-r12

ENTRYPOINT [ "/init" ]
CMD []
COPY root /

