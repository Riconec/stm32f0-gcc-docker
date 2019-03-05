# Testing of the docker images automated build and deploy
# available at https://cloud.docker.com/u/riconec/repository/docker/riconec/stm32f0-gcc-baremetal

# start with minimal image
FROM alpine

WORKDIR /work
ADD . /work

# Install any needed packages specified in requirements.txt
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
# Development files
      build-essential \
      git \
      bzip2 \
      wget && \
    apt clean && \
    wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2017q4/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2 -O cortex_m.tar.bz2 && \
    tar -xjf cortex_m.tar.bz2 && \
    rm cortex_m.tar.bz2

ENV PATH "/work/gcc-arm-none-eabi-7-2017-q4-major/bin:$PATH"

# Greetings
CMD echo "Started Docker image for STM32F0 series development"

