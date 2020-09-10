FROM amazonlinux:1

RUN yum install -y python36 python36-virtualenv zip && yum clean all

COPY requirements.txt zip_layer.sh .

RUN mkdir -p /layer/python && \
    python3.6 -m venv /venv && \
    source /venv/bin/activate && \
    pip install -U pip setuptools && \
    pip install -r requirements.txt -t /layer/python/

CMD bash zip_layer.sh
