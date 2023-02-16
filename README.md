# minecraft-gcp
Personal minecraft server

## Setup guide

1. Follow this tutorial for the most part: https://medium.com/@manbobo2012/host-a-minecraft-server-on-google-cloud-with-automatic-deployment-and-backup-f00d49a1a306
2. Install the appropriate openjdk version (not always 14). As of writing this, openjdk17 is installed in order to use papermc with minecraft 1.19.3.
3. wget from papermc is needed, or other minecraft server files.
4. Skip backup script
5. startup script in `startup.sh`
6. crontab file in `crontab.txt`

## Operations

When inside the compute engine.

1. To check screen status

```
sudo screen -r // to enter screen
ctrl + A, then D // to detach screen back to background
```

2. Check if reboot crontab script is executed

```
cat started_date.txt // make sure the time is correct
```