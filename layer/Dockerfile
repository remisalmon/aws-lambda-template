FROM amazonlinux:2

RUN yum update -y && \
    amazon-linux-extras install python3.8 && \
    yum install zip -y && \
    yum clean all

COPY requirements.txt zip_layer.sh .

RUN mkdir -p /layer/python && \
    python3.8 -m venv venv && \
    source venv/bin/activate && \
    pip install -U pip setuptools && \
    pip install -r requirements.txt -t /layer/python

CMD bash zip_layer.sh
