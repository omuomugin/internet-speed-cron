## Before Exec

```shell
brew install watch

# see also https://github.com/mcastorina/graph-cli
pip install graph-cli 
```

## How to measure

```shell
START_TIMESTAMP=$(date -u +"%Y%m%d_%H%M%S") watch -n 120 ./measure_speed.sh
```

## How to plot

```shell
graph bin/<TARGET-CSV>.csv -x 'timestamp' -y 'download_mbps,upload_mbps' -o bin/measure.png
```
