echo "export AIRFLOW_HOME=/airflow" | sudo tee -a ~airflow/.bashrc > /dev/null
sudo mkdir /logs
sudo chown -R airflow:airflow /logs

#generate config airflow.cfg in $AIRFLOW_HOME on first run
sudo su -c "airflow version" - airflow > /dev/null

sudo su -c 'sed -i "s/^sql_alchemy_conn =.*/sql_alchemy_conn = postgresql:\/\/airflow:pass123@192.168.33.11:5432\/airflow/g" $AIRFLOW_HOME/airflow.cfg' - airflow
sudo su -c 'sed -i "s/^executor =.*/executor = LocalExecutor/g" $AIRFLOW_HOME/airflow.cfg' - airflow
sudo su -c 'sed -i "s/^dags_folder =.*/dags_folder = \/dags/g" $AIRFLOW_HOME/airflow.cfg' - airflow

sudo su -c 'sed -i "s/^base_url =.*/base_url = http:\/\/192.168.33.13:8080/g" $AIRFLOW_HOME/airflow.cfg' - airflow
sudo su -c 'sed -i "s/^rbac =.*/rbac = True/g" $AIRFLOW_HOME/airflow.cfg' - airflow
sudo su -c 'sed -i "s/^base_log_folder =.*/base_log_folder = \/logs/g" $AIRFLOW_HOME/airflow.cfg' - airflow

sudo su -c 'airflow initdb' - airflow

sudo cp /mnt/data/airflow-scheduler.service /etc/systemd/system/
sudo systemctl enable airflow-scheduler
sudo systemctl start airflow-scheduler

sudo su -c "airflow create_user -r Admin -u admin -f John -l Wick -e admin@tm.com.my -p pass123" - airflow