#!/usr/bin/env bash
# Pemakaian: ./scripts/debloat.sh packages/batch2-safe.txt
set -u
[ $# -ge 1 ] || { echo "Pemakaian: $0 <file_daftar_paket>"; exit 1; }
LOGDIR="$(dirname "$0")/../logs"; mkdir -p "$LOGDIR"
LOG="$LOGDIR/dinonaktifkan.txt"
grep -v '^\s*#' "$1" | sed '/^\s*$/d' | while read -r p; do
  if adb shell pm disable-user --user 0 "$p" 2>&1 | grep -q "disabled-user"; then
    echo "[OK]   $p"; echo "$p" >> "$LOG"
  else
    echo "[SKIP] $p"
  fi
done
echo "Selesai. Log: $LOG"
