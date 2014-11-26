VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.3.5"

#Vagrant::Config.run do |config|
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "centos-7.0-x86_64.box"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://dl.dropboxusercontent.com/s/w3lbekm7eunrskm/centos-7.0-x86_64.box"

  ############################################
  ### NODE 0 - DB
  ############################################
  config.vm.define :"node0" do |node0|

    # VM customization
    #node0.vm.customize [
    #  "modifyvm", :id,
    #  "--name", " JMVTA - Server",
    #  "--memory", "256",
    #  "--cpus", "1",
    #]

    node0.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--name", "Cent - Database", "--memory", "256", "--cpus", "1"]
    end
  
    # network
    #node0.vm.network "public_network", ip: "172.22.17.1
    #node0.vm.network :hostonly, "192.168.233.10"
    node0.vm.network "private_network", ip: "192.168.1.10"

    # SSH
    #node0.vm.forward_port 22, 20022
    #node0.vm.network "forwarded_port", guest: 22, host: 20022
    # config.ssh.host - The hostname or IP to SSH into. By default this is empty, because the provider usually figures this out for you.
    # config.ssh.port - The port to SSH into. By default this is port 22.
    #node0.ssh.guest_port = 20022

    # set hostname
    #node0.vm.provision :shell do |shell|
    #  shell.path = "scripts/provision.sh"
    #  shell.args = "'node0.asors_backoffice.internal'"
    #end

    node0.vm.provision "shell" do |s|
      #s.inline = "echo hello"
      s.path = "scripts/provision.sh"
      s.args = "'node0.jmvta.internal'"
    end

    #node0.vm.provision :puppet do |puppet|
    #  puppet.manifests_path = "puppet/manifests"
    #  puppet.module_path    = "puppet/modules"
    #  puppet.manifest_file  = "default.pp"
    #end

    node0.vm.provision "puppet" do |p|
      p.manifests_path = "puppet/manifests"
      p.module_path    = "puppet/modules"
      p.manifest_file  = "default.pp"
    end
  end

  ############################################
  ### NODE 1 - Worker
  ############################################
  config.vm.define :"node1" do |node1|
    node1.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--name", "Cent - Server", "--memory", "256", "--cpus", "1"]
    end
  
    # network
    node1.vm.network "private_network", ip: "192.168.1.11"

    node1.vm.provision "shell" do |s|
      #s.inline = "echo hello"
      s.path = "scripts/provision.sh"
      s.args = "'node1.jmvta.internal'"
    end

    node1.vm.provision "puppet" do |p|
      p.manifests_path = "puppet/manifests"
      p.module_path    = "puppet/modules"
      p.manifest_file  = "default.pp"
    end
  end

end
