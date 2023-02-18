# minecraft-gcp
Personal minecraft server

## Setup guide

1. Follow this tutorial for the most part: https://medium.com/@manbobo2012/host-a-minecraft-server-on-google-cloud-with-automatic-deployment-and-backup-f00d49a1a306
2. Install the appropriate openjdk version (not always 14). As of writing this, openjdk17 is installed in order to use papermc with minecraft 1.19.3.
3. wget from papermc is needed, or other minecraft server files.
4. Skip backup script
5. crontab file in `crontab.txt`, make sure to adjust the USER's home folder. You can choose to only use the lines you need.
6. Copy scripts. Always copy them to `/etc/init.d/<script_name>` and run `chmod 755 /etc/init.d/<script_name>`:
	1. startup script in `startup.sh`. It is triggered every reboot from crontab. This script contains the startup parameters, so feel free to adjust it based on the available resources.
	2. auto-shutdown script in `autoshutdown.sh`. It is triggered every 15 mins from crontab. The interval of 15 mins can always be changed to any interval as long as it is supported by cron.

## Operations

When inside the compute engine.

1. To check screen status

```
sudo screen -r // to enter screen
ctrl + A, then D // to detach screen back to background
```

2. Check if crontab scripts are executed

```
cat started_date.txt // To check startup script
cat shutdown_date.txt // To check shutdown script
```