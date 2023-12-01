Vagrant.configure("2") do |config| 
    config.vm.define "docker_host" do |dh|
    config.vm.box = "bento/ubuntu-22.04"
    config.vm.network "private_network", type: "dhcp", ip: "192.168.56.100"
    config.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
    config.vm.network "forwarded_port", guest: 8081, host: 8081, auto_correct: true
    config.vm.network "forwarded_port", guest: 8082, host: 8082, auto_correct: true
    config.vm.network "forwarded_port", guest: 9000, host: 9000, auto_correct: true 
    dh.vm.provision "shell", path: "docker_bootstrap.sh", privileged: "true"
  
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024" 
      vb.cpus="2"
    end
  

  

