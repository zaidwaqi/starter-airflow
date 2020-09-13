sudo su -c "psql -c \"CREATE USER airflow WITH PASSWORD 'pass123';\"" - postgres > /dev/null
sudo su -c "psql -c \"CREATE DATABASE airflow OWNER airflow;\"" - postgres > /dev/null

echo "host    airflow         airflow         192.168.33.0/24         md5"      \
    |  sudo su -c 'tee -a $PGDATA/pg_hba.conf' - postgres > /dev/null

sudo systemctl reload postgresql-12