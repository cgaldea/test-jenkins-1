From alpine

RUN apk update
RUN apk add  bash python python-dev  py-pip py-virtualenv py-flask  util-linux
RUN mkdir /opt/app
#RUN bash
COPY src/*  /opt/app/
#RUN ["/bin/bash", "-c", "virtualenv --python=python3 entorno_virtual "]
#COPY requirements.txt /opt/app/
RUN ["/bin/bash", "-c", "pip freeze >> /opt/app/requirements.txt "]
RUN ["/bin/bash", "-c", "pip install -r /opt/app/requirements.txt "]
ENTRYPOINT  ["/bin/bash", "-c", "/usr/bin/python  /opt/app/main.py"]
