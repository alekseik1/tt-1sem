FROM ubuntu:18.04
LABEL maintainer="Aleksei Kozharin <1alekseik1@gmail.com>"

RUN apt-get update && \
	apt-get install --yes software-properties-common && \
    apt install --yes curl && \
    curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    sh -c "echo deb https://deb.nodesource.com/node_8.x bionic main \
    > /etc/apt/sources.list.d/nodesource.list" && \
    apt update && \
    apt install --yes nodejs


RUN mkdir /home/nuf

# run following commands from user's home directory
WORKDIR /home/nuf

# copy the testnet-box files into the image
ADD . /home/nuf/quack



# run commands from inside the testnet-box directory
WORKDIR /home/nuf/quack

# Install required python packaged
RUN pip install -r requirements.txt 

CMD ["/bin/bash"]
