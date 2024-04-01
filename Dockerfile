FROM ubuntu

ENV MAGI_BIN_URL "https://github.com/m-pays/magi/releases/download/v1.4.6.2/m-wallet-1.4.6.2-linux.tar.gz"

WORKDIR /magi

RUN apt-get update && apt-get install -y wget \
  && wget ${MAGI_BIN_URL} \
  && tar -zxvf $(basename ${MAGI_BIN_URL}) -C . \
  && mkdir data \
  && rm $(basename ${MAGI_BIN_URL}) \
  && mv m-wallet-1* m-wallet-latest-linux \
  && cp m-wallet-latest-linux/conf/magi.conf data/magi.conf

ENV BIN_DIR /magi/m-wallet-latest-linux/bin/64
ENV DATA_DIR /magi/data

# Specify configuration file
ENV CONF /magi/data/magi.conf

EXPOSE 8232
EXPOSE 8233

# Add the binary directory to the PATH
ENV PATH="${BIN_DIR}:${PATH}"

# Set default RPC credentials as environment variables
ENV RPC_USER=rpcuser=a-username-matching-your-magi-conf
ENV RPC_PASSWORD=a-password-matching-your-magi-conf

# Run magid using the configuration file and environment variables
CMD magid -conf=$CONF -datadir=$DATA_DIR -rpcuser=$RPC_USER -rpcpassword=$RPC_PASSWORD
