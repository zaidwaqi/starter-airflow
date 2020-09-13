sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --reload