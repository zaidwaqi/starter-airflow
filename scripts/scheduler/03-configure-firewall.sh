sudo systemctl start firewalld
sudo systemctl enable firewalld

sudo firewall-cmd --permanent --zone=public --add-service=ssh
sudo firewall-cmd --permanent --zone=public --add-service=nfs
sudo firewall-cmd --permanent --zone=public --add-service=rpc-bind
sudo firewall-cmd --permanent --zone=public --add-service=mountd
sudo firewall-cmd --reload