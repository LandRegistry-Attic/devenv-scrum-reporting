# -*- mode: ruby -*-
# vi: set ft=ruby :

# Load configuration file
require 'yaml'
dir = File.dirname(File.expand_path(__FILE__))
conf = YAML.load_file("#{dir}/configuration.yaml")



Vagrant.configure(2) do |node|
  node.vm.box              = "landregistry/centos"
  node.vm.box_version      = "0.3.0"
  node.vm.box_check_update = true
  node.ssh.forward_agent = true
  node.vm.network "private_network", :ip => "172.16.42.66"
  # Prevent annoying "stdin: is not a tty" errors from displaying during 'vagrant up'
  node.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  node.vm.synced_folder "apps", "/opt/landregistry/"


  # Sync folders
  #node.vm.synced_folder "./apps", "/home/vagrant/apps"

  # Set up the VM
  node.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', ENV['VM_MEMORY'] || 4096]
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    vb.customize ["modifyvm", :id, "--cpus", ENV['VM_CPUS'] || 4]
  end

  # Run script to configure environment
  node.vm.provision :shell, :inline => "source /vagrant/local/lr-setup-environment"
end
