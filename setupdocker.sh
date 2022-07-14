cd /tmp
apt remove -y docker-hypriot
wget https://download.docker.com/linux/static/stable/aarch64/docker-20.10.9.tgz
tar xzvf docker-20.10.9.tgz
cp docker/* /usr/bin/
echo "arm_64bit=1" >> /boot/config.txt
cd /etc/systemd/system
rm docker.service
rm docker.socket
wget https://github.com/moby/moby/raw/master/contrib/init/systemd/docker.service
wget https://github.com/moby/moby/raw/master/contrib/init/systemd/docker.socket
systemctl enable docker.service
systemctl enable containerd.service
reboot
