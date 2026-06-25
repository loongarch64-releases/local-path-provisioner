FROM lcr.loongnix.cn/library/debian:unstable

RUN apt update && apt install -y git \
    docker-cli

    

ENV LPP_VERSION=''

CMD ["sh", "-c","/workspace/process_version.sh $LPP_VERSION"]
