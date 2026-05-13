# adsb.ezz456ch.com feed client

Script for installing Feed Clients

Decoder (such as dump1090-fa or readsb) must be installed.

These scripts aid in setting up your current ADS-B receiver to feed adsb.ezz456ch.com.

They will not disrupt any existing feed clients already present

## 1. Find coordinates / elevation

[FreeMapTools](https://www.freemaptools.com/elevation-finder.htm)

## 2. Install the Feed Client

```bash copy
curl -L -o /tmp/install.sh https://raw.githubusercontent.com/ezz456CH/adsb-feedclient/master/install.sh
sudo bash /tmp/install.sh
```

## 3. Check your feed status (optional :3)

3.1 With API

```bash copy
curl https://api.adsb.ezz456ch.com/v1/stats
```

3.2 View at [https://adsb.ezz456ch.com](https://adsb.ezz456ch.com)

3.3 View at MLAT Coverage Map [https://adsb.ezz456ch.com/mlat-map/](https://adsb.ezz456ch.com/mlat-map/)

3.4 Check the status of Feed Client

```bash copy
sudo systemctl status ezz456ch-adsb-feed
sudo systemctl status ezz456ch-mlat
```

## Helpful Information

### Update the feed client without reconfiguring

```bash copy
curl -L -o /tmp/update.sh https://raw.githubusercontent.com/ezz456CH/adsb-feedclient/master/update.sh
sudo bash /tmp/update.sh
```

### Reconfigure the client without reinstalling

```bash copy
sudo nano /etc/default/adsb.ezz456ch.com
```

After configuring, don't forget to restart the Feed Client!

```bash copy
sudo systemctl restart ezz456ch-adsb-feed
sudo systemctl restart ezz456ch-mlat
```

### Uninstall Feed Client

```bash copy
sudo bash /usr/local/share/adsb.ezz456ch.com/uninstall.sh
```