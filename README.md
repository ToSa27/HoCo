# HoCo
Home Control Framework

Base Install
- Raspbian Jessie Lite image on SD
- add empty `ssh` file to the boot partition if you want to connect through ssh
- boot and login as user pi
  - `wget https://raw.githubusercontent.com/ToSa27/HoCo/master/setup_root.sh`
  - `chmod 755 setup_root.sh`
  - `sudo ./setup_root.sh` (or to log what's going on for later review: `sudo ./setup_root.sh |& tee -a setup_root.log`
- follow the instructions on screen
- the pi will reboot several times (no need to login)
- to check if the setup is complete, login as user `hoco` and check if the file `/opt/hoco/setup/setup_done.log` exists
