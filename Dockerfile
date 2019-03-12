# Testing of the docker images automated build and deploy
# available at https://cloud.docker.com/u/riconec/repository/docker/riconec/stm32f0-gcc-baremetal

# start with minimal image
FROM ubuntu

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
      apt clean
    
RUN apt-get install gcc-arm-none-eabi -y

# Greetings
CMD echo "Started Docker image for STM32F0\1 series development"

