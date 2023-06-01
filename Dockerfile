FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y git wget \
                   python3 python3-pip python-is-python3 \
                   ffmpeg libsndfile1-dev && \
    git clone https://github.com/RVC-Project/Retrieval-based-Voice-Conversion-WebUI.git rvc && \
    cd rvc && \
    pip install -r requirements.txt

WORKDIR /rvc

CMD ["python3","infer-web.py"]
