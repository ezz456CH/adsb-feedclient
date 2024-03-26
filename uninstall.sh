#!/bin/bash
set -x

IPATH=/usr/local/share/ezz456ch

systemctl disable --now ezz456ch-mlat
systemctl disable --now ezz456ch-mlat2 &>/dev/null
systemctl disable --now ezz456ch-feed

if [[ -d /usr/local/share/tar1090/html-ezz456ch ]]; then
    bash /usr/local/share/tar1090/uninstall.sh ezz456ch
fi

rm -f /lib/systemd/system/ezz456ch-mlat.service
rm -f /lib/systemd/system/ezz456ch-mlat2.service
rm -f /lib/systemd/system/ezz456ch-feed.service

cp -f "$IPATH/ezz456ch-uuid" /tmp/ezz456ch-uuid
rm -rf "$IPATH"
mkdir -p "$IPATH"
mv -f /tmp/ezz456ch-uuid "$IPATH/ezz456ch-uuid"

set +x

echo -----
echo "adsb.ezz456ch.xyz feed scripts have been uninstalled!"
