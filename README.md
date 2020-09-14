Simple Apache Airflow LocalExecutor setup utilizing Vagrant starter-base box.
As file sharing between host and guest VM's is currently used to copy configuration files, vagrant-vbguest plugin may be required.
Example: vagrant plugin install vagrant-vbguest

Upon vagrant up, Airflow UI will be accessble via http://192.168.33.13:8080.
Login with: 
Username admin
Password pass123
