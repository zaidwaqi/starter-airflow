sudo mount 192.168.33.12:/logs /logs

echo "192.168.33.12:/logs /logs    nfs     nosuid,rw,sync,hard,intr  0  0" | sudo tee -a /etc/fstab > /dev/null