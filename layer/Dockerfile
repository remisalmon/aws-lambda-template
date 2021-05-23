FROM amazonlinux:2

RUN yum update -y && \
    amazon-linux-extras install python3.8 -y && \
    yum install zip -y && \
    yum clean all

COPY requirements.txt zip_layer.sh .

RUN mkdir -p layer/python && \
    python3.8 -m venv venv && \
    source venv/bin/activate && \
    python3.8 -m pip install -U pip setuptools && \
    python3.8 -m pip install -r requirements.txt -t /layer/python

CMD bash zip_layer.sh
