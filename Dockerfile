# Minimal Docker image for RecBole using PyTorch base
FROM pytorch/pytorch:2.9.1-cuda13.0-cudnn9-runtime
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install RecBole
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y git && \
    pip install --no-cache-dir --upgrade numpy pandas && \
    git clone https://github.com/RUCAIBox/RecBole.git && \
    mv RecBole /usr/local/bin/RecBole && \
    echo "alias run_hyper='python /usr/local/bin/RecBole/run_hyper.py'" >> ~/.bashrc && \
    echo "alias run_recbole='python /usr/local/bin/RecBole/run_recbole.py'" >> ~/.bashrc && \
    echo "alias run_recbole_group='python /usr/local/bin/RecBole/run_recbole_group.py'" >> ~/.bashrc && \
    rm -rf /root/.cache /tmp/*
