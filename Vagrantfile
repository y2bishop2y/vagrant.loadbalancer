# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files/vagrantup.com/precise64.box"

  #=============================
  #-----------------------------
  config.vm.define "lb" do |lb|

    lb.vm.network :private_network, ip: "192.168.8.1"
    lb.vm.hostname = "lb.local"

    lb.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.manifest_file  = "lb.pp"

    end

  end

  #=============================
  #-----------------------------
  config.vm.define "tomcat1" do |tomcat1|
    
    tomcat1.vm.network :private_network, ip: "192.168.8.2"
    tomcat1.vm.hostname = "tomcat1.local"
    
    tomcat1.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.manifest_file  = "tomcat1.pp"

    end
  end



  #=============================
  #-----------------------------
  config.vm.define "tomcat2" do |tomcat2|


    tomcat2.vm.network :private_network, ip: "192.168.8.3"
    tomcat2.vm.hostname = "tomcat2.local"

    tomcat2.vm.provision :pupplet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.manifest_file  = "tomcat2.pp"


    end

  end


  
end
