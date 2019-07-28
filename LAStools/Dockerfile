# Example command
#
# docker run --rm -it \
#   -v $(pwd):/root/laz_files \
#   --name lastools \
#   pydo/lastools
#   las2las -i unconverted_file.las -o converted_file.laz
#
FROM debian:stretch-slim as builder
LABEL maintainer "Devon Hakel-Kinko <maintainer@devon.ninja>"

RUN apt update -y \
    && apt install git gcc wget curl make bash unzip g++ -y \
    && wget https://lastools.github.io/download/LAStools.zip \
    && unzip LAStools.zip \
    && cd LAStools \
    && make \
    && git clone https://github.com/LASvalidator/LASread.git \
    && cd LASread && make && cd .. \
    && git clone https://github.com/LASvalidator/lasvalidate.git \
    && cd lasvalidate && make

FROM debian:stretch-slim
ENV PATH="$PATH:/opt/LAStools"
COPY --from=builder /LAStools/bin /opt/LAStools
