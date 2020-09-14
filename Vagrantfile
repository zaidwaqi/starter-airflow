# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "metadb" do |am|
    am.vm.provider "virtualbox" do |v|
      v.name = "airflow-metadb"
    end
    am.vm.box = "zaidwaqi/starter-base"
    am.vm.synced_folder '.', '/vagrant', disabled: true
    am.vm.network "private_network", ip: "192.168.33.11"    
    am.vm.provision "set-hostname", type: "shell", inline: "sudo hostnamectl set-hostname metadb"
    am.vm.provision "setup-postgres", type: "shell", path: "scripts/metadb/01-setup-postgres.sh", privileged: false
    am.vm.provision "setup-airflow-metadb", type: "shell", path: "scripts/metadb/02-setup-airflow-metadb.sh", privileged: false
    am.vm.provision "configure-firewall", type: "shell", path: "scripts/metadb/03-configure-firewall.sh", privileged: false
  end

  config.vm.define "scheduler" do |as|
    as.vm.provider "virtualbox" do |v|
      v.name = "airflow-scheduler"
    end
    as.vm.box = "zaidwaqi/starter-base"
    as.vm.synced_folder '.', '/vagrant', disabled: false
    as.vm.synced_folder "./dags", "/dags"    
    as.vm.synced_folder "./data", "/mnt/data"
    as.vm.network "private_network", ip: "192.168.33.12"
    as.vm.provision "set-hostname", type: "shell", inline: "sudo hostnamectl set-hostname scheduler"
    as.vm.provision "configure-airflow-scheduler", type: "shell", path: "scripts/scheduler/01-configure-airflow-scheduler.sh", privileged: false 
    as.vm.provision "configure-log-nfs", type: "shell", path: "scripts/scheduler/02-configure-log-nfs.sh", privileged: false
    as.vm.provision "configure-firewall", type: "shell", path: "scripts/scheduler/03-configure-firewall.sh", privileged: false
  end

  config.vm.define "webserver" do |aw|
    aw.vm.provider "virtualbox" do |v|
      v.name = "airflow-webserver"
    end   
    aw.vm.box = "zaidwaqi/starter-base"
    aw.vm.synced_folder '.', '/vagrant', disabled: false
    aw.vm.synced_folder "./dags", "/dags"    
    aw.vm.synced_folder "./data", "/mnt/data"
    aw.vm.network "private_network", ip: "192.168.33.13"
    aw.vm.synced_folder "./dags", "/dags"
    aw.vm.synced_folder "./data", "/mnt/data"
    aw.vm.provision "set-hostname", type: "shell", inline: "sudo hostnamectl set-hostname webserver"
    aw.vm.provision "configure-airflow-webserver", type: "shell", path: "scripts/webserver/01-configure-airflow-webserver.sh", privileged: false
    aw.vm.provision "configure-log-nfs", type: "shell", path: "scripts/webserver/02-configure-log-nfs.sh", privileged: false
    aw.vm.provision "configure-firewall", type: "shell", path: "scripts/webserver/03-configure-firewall.sh", privileged: false
  end
end
