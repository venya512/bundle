#!/bin/sh
set -e

OUT_DIR=/tmp/support-bundle
mkdir -p $OUT_DIR

echo "=== IP ===" > $OUT_DIR/info.txt
curl -s https://ifconfig.me >> $OUT_DIR/info.txt

echo "\n=== CPU ===" >> $OUT_DIR/info.txt
lscpu >> $OUT_DIR/info.txt

echo "\n=== GPU ===" >> $OUT_DIR/info.txt
nvidia-smi >> $OUT_DIR/info.txt || echo "no gpu" >> $OUT_DIR/info.txt

cat $OUT_DIR/info.txt
