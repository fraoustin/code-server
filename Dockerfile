FROM linuxserver/code-server:4.4.0
RUN apt-get update \
    && apt-get install -y libsqlite3-dev wget curl vim\
    && apt-get install -y python3-dev python3-pip \
    && pip3 install --upgrade pip --user \
    && apt-get install -y yarn \
    && apt-get clean \
    && apt-get auto-remove -y \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN pip3 install --upgrade pip \
    && pip3 install python-language-server flake8 autopep8 flask colorconsole pylint requests httpie Flask-Login Flask-SQLAlchemy

# install  pythonrc and PYTHONSTARTUP
COPY bashrc /config/.bashrc
COPY pythonrc /config/.pythonrc
COPY gitconfig /config/.gitconfig
ENV SHELL=/bin/bash

# Install Docker client
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" \
    && apt-get update \
    && apt-get -y install docker-ce-cli \
    && apt -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

