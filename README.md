# adsb.ezz456ch.xyz feed client

Script for installing Feed Clients

Decoder (such as dump1090 or readsb) must be installed.

These scripts aid in setting up your current ADS-B receiver to feed adsb.ezz456ch.xyz.

They will not disrupt any existing feed clients already present

## 1. Find coordinates/elevation:

[FreeMapTools](https://www.freemaptools.com/elevation-finder.htm)

## 2. Install the Feed Clients

```
curl -L -o /tmp/ezz456ch-feed.sh https://raw.githubusercontent.com/ezz456CH/adsb-feedclient/master/install.sh
sudo bash /tmp/ezz456ch-feed.sh
```

## 3. Check your feed status (Optional :3)

3.1 With API

```
curl https://api.ezz456ch.xyz/api/stats | json_pp
```

3.2 View at <https://adsb.ezz456ch.xyz>

3.3 View at MLAT Coverage Map <https://adsb.ezz456ch.xyz/mlat-map/>

3.4 Check the status of Feed Clients

```
sudo systemctl status ezz456ch-feed
sudo systemctl status ezz456ch-mlat
```

## Helpful Information

### Update the feed client without reconfiguring

```
curl -L -o /tmp/ezz456ch-update.sh https://raw.githubusercontent.com/ezz456CH/adsb-feedclient/master/update.sh
sudo bash /tmp/ezz456ch-update.sh
```

### Reconfigure the client without reinstalling

```
sudo nano /etc/default/ezz456ch
```

After configuring, don't forget to restart the Feed Clients!

```
sudo systemctl restart ezz456ch-feed
sudo systemctl restart ezz456ch-mlat
```

### Uninstall Feed Clients

```
sudo bash /usr/local/share/ezz456ch/uninstall.sh
```
