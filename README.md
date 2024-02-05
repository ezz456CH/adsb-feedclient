# adsb.ezz456ch.xyz feed client

- These scripts aid in setting up your current ADS-B receiver to feed adsb.ezz456ch.xyz.
- They will not disrupt any existing feed clients already present

## 1: Find coordinates/elevation:

<https://www.freemaptools.com/elevation-finder.htm>

## 2: Install the adsb.ezz456ch.xyz feed client

```
curl -L -o /tmp/ezz456chfeed.sh https://raw.githubusercontent.com/ezz456CH/adsb-feedclient/master/install.sh
sudo bash /tmp/ezz456chfeed.sh
```

### Update the feed client without reconfiguring

```
curl -L -o /tmp/ezz456chupdate.sh https://raw.githubusercontent.com/ezz456CH/adsb-feedclient/master/update.sh
sudo bash /tmp/ezz456chupdate.sh
```

### Show feed client status

```
sudo systemctl status ezz456ch-feed
```
