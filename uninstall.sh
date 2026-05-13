#!/bin/bash
set -x

IPATH=/usr/local/share/adsb.ezz456ch.com

systemctl disable --now ezz456ch-mlat
systemctl disable --now ezz456ch-mlat2 &>/dev/null
systemctl disable --now ezz456ch-adsb-feed

rm -f /lib/systemd/system/ezz456ch-mlat.service
rm -f /lib/systemd/system/ezz456ch-mlat2.service
rm -f /lib/systemd/system/ezz456ch-adsb-feed.service

cp -f "$IPATH/uuid" /tmp/uuid
rm -rf "$IPATH"
mkdir -p "$IPATH"
mv -f /tmp/uuid "$IPATH/uuid"

set +x

echo -----
echo "adsb.ezz456ch.com feed scripts have been uninstalled!"
