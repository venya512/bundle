#!/bin/sh

# не падаем если команда ломается
set +e

TMP_FILE="/host/tmp/custom-hostinfo.txt"

echo "=== CUSTOM HOST INFO ===" > $TMP_FILE
echo "" >> $TMP_FILE

# IP
echo "=== IP ===" >> $TMP_FILE
hostname -I >> $TMP_FILE 2>&1
echo "" >> $TMP_FILE

# CPU
echo "=== CPU ===" >> $TMP_FILE
lscpu >> $TMP_FILE 2>&1
echo "" >> $TMP_FILE

# MEMORY
echo "=== MEMORY ===" >> $TMP_FILE
free -h >> $TMP_FILE 2>&1
echo "" >> $TMP_FILE

# DISK
echo "=== DISK ===" >> $TMP_FILE
df -h >> $TMP_FILE 2>&1
echo "" >> $TMP_FILE

# GPU (может не быть)
echo "=== GPU ===" >> $TMP_FILE
nvidia-smi >> $TMP_FILE 2>&1 || echo "no gpu" >> $TMP_FILE
echo "" >> $TMP_FILE

# KERNEL
echo "=== KERNEL ===" >> $TMP_FILE
uname -a >> $TMP_FILE 2>&1
echo "" >> $TMP_FILE

# DOCKER
echo "=== DOCKER ===" >> $TMP_FILE
docker ps -a >> $TMP_FILE 2>&1
echo "" >> $TMP_FILE

# K8S (если есть kubectl)
echo "=== K8S NODES ===" >> $TMP_FILE
kubectl get nodes >> $TMP_FILE 2>&1
echo "" >> $TMP_FILE

echo "=== K8S PODS ===" >> $TMP_FILE
kubectl get pods -A >> $TMP_FILE 2>&1
echo "" >> $TMP_FILE

# 🔥 ПЕРЕЗАТИРАЕМ hostinfo
echo "=== REPLACING HOSTINFO ==="

find /host -type f -name hostinfo 2>/dev/null | while read f; do
  echo "Replacing $f"
  cp $TMP_FILE "$f"
done

echo "=== DONE ==="
