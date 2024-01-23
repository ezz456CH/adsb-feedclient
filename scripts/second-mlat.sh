#!/bin/bash
SERVICE="/lib/systemd/system/ezz456ch-mlat2.service"

if [[ -z ${1} ]]; then
    echo --------------
    echo ERROR: requires a parameter
    exit 1
fi

cat >"$SERVICE" <<"EOF"
[Unit]
Description=ezz456ch-mlat2
Wants=network.target
After=network.target

[Service]
User=ezz456ch
EnvironmentFile=/etc/default/ezz456CH
ExecStart=/usr/local/share/ezz456CH/venv/bin/mlat-client \
    --input-type $INPUT_TYPE --no-udp \
    --input-connect $INPUT \
    --server adsb.ezz456ch.xyz:SERVERPORT \
    --user $USER \
    --lat $LATITUDE \
    --lon $LONGITUDE \
    --alt $ALTITUDE \
    $UUID_FILE \
    $PRIVACY \
    $RESULTS
Type=simple
Restart=always
RestartSec=30
StartLimitInterval=1
StartLimitBurst=100
SyslogIdentifier=ezz456ch-mlat2
Nice=-1

[Install]
WantedBy=default.target
EOF

if [[ -f /boot/adsb-config.txt ]]; then
    sed -i -e 's#EnvironmentFile.*#EnvironmentFile=/boot/adsb-env\nEnvironmentFile=/boot/adsb-config.txt#' "$SERVICE"
fi

sed -i -e "s/SERVERPORT/${1}/" "$SERVICE"
if [[ -n ${2} ]]; then
    sed -i -e "s/\$RESULTS/${2}/" "$SERVICE"
fi

systemctl enable ezz456ch-mlat2
systemctl restart ezz456ch-mlat2
