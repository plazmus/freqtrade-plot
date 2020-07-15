# Docker Image from freqtrade

## Description

Based on freqtrade/freqtrade:develop

Added requirements https://raw.githubusercontent.com/freqtrade/freqtrade/develop/requirements-plot.txt

How to run:
```
docker image build .

# load backtest-result.json file to plot
docker-compose -f docker-compose.plot.yml run --name freqtrade-plot --rm freqtrade plot-dataframe --strategy Strategy001 -p ADA/BTC LINK/BTC --timerange 20200402-20200603 -i 1h
```

Make sure to export trades while backtesting
```
docker-compose run --name freqtrade --rm freqtrade backtesting --export trades --config user_data/config.json --strategy-list Strategy001 Strategy002 --timerange 20200402-20200603 -i 1h

# use backtest-result-Strategy001.json, which is created when backtesting multiple strategies at once
docker-compose -f docker-compose.plot.yml run --name freqtrade-plot --rm freqtrade plot-dataframe --strategy Strategy001 --export-filename user_data/backtest_results/backtest-result-Strategy001.json -p ADA/BTC LINK/BTC --timerange 20200402-20200603 -i 1h --indicators2 cci
```
You can also replace `plot-dataframe` with `plot-profit` to get profits graph

