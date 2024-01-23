#!/bin/bash
set -x

IPATH=/usr/local/share/ezz456CH

systemctl disable --now ezz456ch-mlat
systemctl disable --now ezz456ch-mlat2 &>/dev/null
systemctl disable --now ezz456ch-feed

if [[ -d /usr/local/share/tar1090/html-adsb ]]; then
    bash /usr/local/share/tar1090/uninstall.sh adsb
fi

rm -f /lib/systemd/system/ezz456ch-mlat.service
rm -f /lib/systemd/system/ezz456ch-mlat2.service
rm -f /lib/systemd/system/ezz456ch-feed.service

cp -f "$IPATH/adsb-uuid" /tmp/adsb-uuid
rm -rf "$IPATH"
mkdir -p "$IPATH"
mv -f /tmp/adsb-uuid "$IPATH/adsb-uuid"

set +x

echo -----
echo "adsb.ezz456ch.xyz feed scripts have been uninstalled!"
