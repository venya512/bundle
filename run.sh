#!/bin/sh
set +e

TMP_FILE="/host/tmp/custom-hostinfo.txt"

echo "=== CUSTOM HOST INFO ===" > $TMP_FILE
echo "" >> $TMP_FILE

echo "=== IP ===" >> $TMP_FILE
hostname -I >> $TMP_FILE 2>&1
echo "" >> $TMP_FILE

echo "=== CPU ===" >> $TMP_FILE
lscpu >> $TMP_FILE 2>&1
echo "" >> $TMP_FILE

echo "=== MEMORY ===" >> $TMP_FILE
free -h >> $TMP_FILE 2>&1
echo "" >> $TMP_FILE

echo "=== DISK ===" >> $TMP_FILE
df -h >> $TMP_FILE 2>&1
echo "" >> $TMP_FILE

echo "=== GPU ===" >> $TMP_FILE
timeout 3 nvidia-smi >> $TMP_FILE 2>&1 || echo "no gpu" >> $TMP_FILE
echo "" >> $TMP_FILE

echo "=== KERNEL ===" >> $TMP_FILE
uname -a >> $TMP_FILE 2>&1
echo "" >> $TMP_FILE

# ❌ УБРАЛ docker
# ❌ УБРАЛ kubectl

# 🔥 БЫСТРАЯ замена hostinfo (без find по всей системе)
for f in /host/var/lib/longhorn/*/hostinfos/hostinfo; do
  if [ -f "$f" ]; then
    echo "Replacing $f"
    cp $TMP_FILE "$f"
  fi
done

echo "=== DONE ==="
