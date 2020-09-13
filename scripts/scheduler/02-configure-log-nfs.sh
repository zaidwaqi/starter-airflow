sudo systemctl start nfs-server rpcbind
sudo systemctl enable nfs-server rpcbind

echo "/logs 192.168.33.13(rw,sync,no_root_squash)"  |  sudo tee -a /etc/exports > /dev/null
sudo exportfs -a