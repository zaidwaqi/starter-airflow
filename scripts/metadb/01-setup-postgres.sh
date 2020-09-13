echo "export PGBIN=/usr/pgsql-12/bin" | sudo tee -a ~postgres/.bash_profile > /dev/null
echo "export PATH=\$PGBIN:\$PATH" | sudo tee -a ~postgres/.bash_profile > /dev/null

sudo su -c "initdb" - postgres
sudo su -c 'sed -i "s/^#listen_addresses =.*/listen_addresses = '\''*'\''/g" $PGDATA/postgresql.conf' - postgres

sudo systemctl enable postgresql-12
sudo systemctl start postgresql-12