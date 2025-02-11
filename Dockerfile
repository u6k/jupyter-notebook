FROM jupyter/datascience-notebook:python-3.8.8
LABEL maintainer="u6k.apps@gmail.com"

USER root

RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install -U \
        # https://github.com/ryantam626/jupyterlab_code_formatter
        jupyterlab_code_formatter autopep8 isort black yapf \
        # https://github.com/jupyterlab/jupyterlab-git
        jupyterlab-git \
        # https://github.com/deshaw/jupyterlab-execute-time
        jupyterlab_execute_time \
        # https://github.com/jtpio/jupyterlab-system-monitor
        jupyterlab-system-monitor \
        # https://github.com/mwakaba2/jupyterlab-notifications
        jupyterlab-notifications \
        # https://github.com/jupyter/nbdime
        nbdime && \
    nbdime extensions --enable
