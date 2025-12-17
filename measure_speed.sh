#!/bin/bash

if [ -z "$START_TIMESTAMP" ]; then
  echo "Error: <START_TIMESTAMP> environment variable is not set" >&2
  exit 1
fi

OUT="./bin/result_${START_TIMESTAMP}.csv"

if [ ! -f "$OUT" ]; then
  echo "timestamp,download_mbps,upload_mbps" > "$OUT"
fi

TIMESTAMP=$(date -u +"%Y%m%d%H%M%S")

RESULT=$(networkQuality -s -c)

DL=$(echo "$RESULT" | jq '.dl_throughput' | awk '{printf "%.2f", $1/1000000}')
UL=$(echo "$RESULT" | jq '.ul_throughput' | awk '{printf "%.2f", $1/1000000}')

echo "$TIMESTAMP,$DL,$UL" >> "$OUT"
