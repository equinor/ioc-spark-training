#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

FROM python:buster

# If you are in the internal network uncomment proxy
#ENV http_proxy=http://www-proxy.statoil.no:80
#ENV https_proxy=http://www-proxy.statoil.no:80

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Configure environment
ENV SHELL=/bin/bash \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

# Configure apt and install packages
RUN apt-get update \
    && apt-get -y install openjdk-11-jdk git procps lsb-release locales fonts-liberation \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    # Update Python environment based on requirements.txt (if presenet)
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen
COPY requirements.txt /tmp/pip-tmp/
RUN if [ -f "/tmp/pip-tmp/requirements.txt" ]; then pip --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt; fi \
    && rm -rf /tmp/pip-tmp 

RUN jupyter notebook --generate-config
COPY .devcontainer/start-notebook.sh /usr/local/bin/start-notebook.sh
RUN chmod 755 /usr/local/bin/start-notebook.sh


# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=
EXPOSE 3000
CMD ["/usr/local/bin/start-notebook.sh"]
