#! /bin/bash

mkdir $HOCO_HOME/data
mkdir $HOCO_HOME/adapter
mkdir $HOCO_HOME/controller
mkdir $HOCO_HOME/logic
mkdir $HOCO_HOME/historian
HOCO_MQTT_URL=$(whiptail --inputbox "Please enter MQTT URL" 20 60 3>&1 1>&2 2>&3)
HOCO_MQTT_USER=$(whiptail --inputbox "Please enter MQTT User" 20 60 "hoco" 3>&1 1>&2 2>&3)
HOCO_MQTT_PASS=$(whiptail --inputbox "Please enter MQTT Password" 20 60 3>&1 1>&2 2>&3)
HOCO_MQTT_PREFIX=$(whiptail --inputbox "Please enter MQTT Prefix" 20 60 "hoco" 3>&1 1>&2 2>&3)
echo 'export HOCO_MQTT_URL='${HOCO_MQTT_URL}'' > $HOCO_HOME/data/config.sh
echo 'export HOCO_MQTT_USER='${HOCO_MQTT_USER}'' >> $HOCO_HOME/data/config.sh
echo 'export HOCO_MQTT_PASS='${HOCO_MQTT_PASS}'' >> $HOCO_HOME/data/config.sh
echo 'export HOCO_MQTT_PREFIX='${HOCO_MQTT_PREFIX}'' >> $HOCO_HOME/data/config.sh
chmod 755 $HOCO_HOME/data/config.sh
curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -
sudo apt-get -y install nodejs
read -p "Install ZWave Adapter? " yn
case $yn in
  [Yy]* )
    $HOCO_HOME/setup/setup_zwave.sh
    ;;
  * )
    exit
    ;;
esac
read -p "Install Homematic Adapter? " yn
case $yn in
  [Yy]* )
    $HOCO_HOME/setup/setup_homematic.sh
    ;;
  * )
    exit
    ;;
esac
sudo reboot