# Minimal Docker image for RecBole using PyTorch base
FROM pytorch/pytorch:2.9.1-cuda13.0-cudnn9-runtime
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install RecBole
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y git wget && \
    pip install --no-cache-dir recbole && \
    pip install --no-cache-dir --force-reinstall numpy==1.26 && \
    wget -O /usr/local/bin/run_hyper.py https://github.com/RUCAIBox/RecBole/raw/refs/heads/master/run_hyper.py && \
    sed -i '1i#! /usr/bin/env python3' /usr/local/bin/run_hyper.py && \
    wget -O /usr/local/bin/run_recbole.py https://github.com/RUCAIBox/RecBole/raw/refs/heads/master/run_recbole.py && \
    sed -i '1i#! /usr/bin/env python3' /usr/local/bin/run_recbole.py && \
    wget -O /usr/local/bin/run_recbole_group.py https://github.com/RUCAIBox/RecBole/raw/refs/heads/master/run_recbole_group.py && \
    sed -i '1i#! /usr/bin/env python3' /usr/local/bin/run_recbole_group.py && \
    chmod a+x /usr/local/bin/run_*.py && \
    rm -rf /root/.cache /tmp/*
