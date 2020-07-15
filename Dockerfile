FROM freqtradeorg/freqtrade:develop

RUN apt-get update \
    && apt-get clean \
    && pip3 install plotly==4.8.2
