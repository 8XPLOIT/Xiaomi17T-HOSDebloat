#!/usr/bin/env bash
# Pemakaian: ./scripts/restore.sh            (pulihkan semua dari log)
#            ./scripts/restore.sh nama.paket (pulihkan satu paket)
if [ $# -ge 1 ]; then adb shell pm enable --user 0 "$1"; exit; fi
LOG="$(dirname "$0")/../logs/dinonaktifkan.txt"
[ -f "$LOG" ] || { echo "Tidak ada log: $LOG"; exit 1; }
while read -r p; do [ -n "$p" ] && adb shell pm enable --user 0 "$p"; done < "$LOG"
echo "Semua paket di log sudah dipulihkan."
