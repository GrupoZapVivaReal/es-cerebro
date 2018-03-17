FROM vivareal/base-images:alpine-3.7-java-8-jdk

ARG CEREBRO_VERSION

RUN apk add --no-cache --update wget

RUN mkdir -p /cerebro && mkdir -p /tmp && cd /tmp && \
    wget https://github.com/lmenezes/cerebro/releases/download/v${CEREBRO_VERSION}/cerebro-${CEREBRO_VERSION}.tgz && \
    tar xzf cerebro-${CEREBRO_VERSION}.tgz -C /cerebro --strip-components=1

WORKDIR /cerebro

EXPOSE 9000

CMD ["bin/cerebro"]
