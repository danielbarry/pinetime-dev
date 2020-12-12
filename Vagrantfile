# Vagrantfile
#
# Reproducible builds for project.
Vagrant.configure("2") do |config|
  # Setup the box configuration
  config.vm.box = "generic/debian10"
  config.vm.hostname = "jf-pinetime.box"
  config.vm.network :private_network, ip: "192.168.69.69"
  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--cpuexecutioncap", "100",
      "--memory", "1024",
    ]
  end
  # Remove need for password
  config.ssh.insert_key = false
  # Sync the current directory
  config.vm.synced_folder "./", "/home/vagrant/dev/"
  # Setup the environment
  config.vm.provision "shell", inline: "cd /home/vagrant/dev/; bash setup.sh"
end
