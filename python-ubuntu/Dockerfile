FROM ubuntu:jammy

RUN : \
    && apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
        python3 \
        python3-dev \
        python3-venv \
        python3-cryptography \
        default-libmysqlclient-dev \
        build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && :

WORKDIR /src

COPY . .
ENV PATH=/venv/bin:$PATH
ENV PIP_DISABLE_PIP_VERSION_CHECK=1

RUN : \
    && python3 -m venv /venv \
    && pip --no-cache-dir install -r requirements.txt \
    && :
