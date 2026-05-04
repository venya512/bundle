#!/bin/sh
set -e

OUT_DIR=/tmp/support-bundle
mkdir -p $OUT_DIR

kubectl get pods -A -o yaml > $OUT_DIR/dump.yaml

tar -czf /tmp/bundle.tar.gz -C $OUT_DIR .

echo "done"
