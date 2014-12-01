VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.3.5"

#Vagrant::Config.run do |config|
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "CentOS-6.5-x86_64-v20140311.box"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.5-x86_64-v20140311.box"

  ############################################
  ### NODE 0 - DB
  ############################################
  config.vm.define :"node0" do |node0|
    node0.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--name", "Cent-DB", "--memory", "256", "--cpus", "1"]
    end
  
    # network
    node0.vm.network "private_network", ip: "192.168.10.10"

    # set hostname
    node0.vm.hostname = "node0.nitrok.local"
    # node0.vm.provision "shell" do |s|
    #   #s.inline = "echo hello"
    #   s.path = "scripts/provision.sh"
    #   s.args = "node0.nitrok.local"
    # end

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
      vb.customize ["modifyvm", :id, "--name", "Cent-Worker", "--memory", "256", "--cpus", "1"]
    end
  
    # network
    node1.vm.network "private_network", ip: "192.168.10.11"

    node1.vm.hostname = "node1.nitrok.local"
    # node1.vm.provision "shell" do |s|
    #   #s.inline = "echo hello"
    #   s.path = "scripts/provision.sh"
    #   s.args = "node1.nitrok.local"
    # end

    node1.vm.provision "puppet" do |p|
      p.manifests_path = "puppet/manifests"
      p.module_path    = "puppet/modules"
      p.manifest_file  = "default.pp"
    end
  end

end
