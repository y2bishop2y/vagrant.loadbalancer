# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.hostmanager.enabled           = true
  config.hostmanager.manage_host       = true
  config.hostmanager.ignore_private_ip = true
  config.hostmanager.include_offline   = true
  config.vm.provision :hostmanager

  #=============================
  # NODE: Tomcat1
  #-----------------------------
  config.vm.define "tomcat1" do |tomcat1|

    #==============================
    # PROVIDER: VirtualBox
    #------------------------------
    tomcat1.vm.provider :virtualbox do |vb, override|
      # tomcat1.hostmanager.aliases = %w(lb.local lb-alias)
      tomcat1.hostmanager.manage_host       = true
      tomcat1.hostmanager.ignore_private_ip = true
      tomcat1.hostmanager.interface         = ENV[ "GUEST_INTERFACE"] 

      override.vm.box     = "precise64"
      override.vm.box_url = "http://files/vagrantup.com/precise64.box"

      override.vm.network :public_network, :bridge => ENV[ 'BRIDGE_INTERFACE' ]
      # override.vm.network :private_network, ip: "33.33.33.50"
      override.vm.hostname = "tomcat1.local"
      # override.vm.ssh.timeout   = 300
      # override.vm.ssh.max_tries = 300

      vb.customize [
                    'modifyvm', :id,
                    '--name', 'tomcat1.local',
                    '--natdnshostresolver1', 'on',
                    '--natdnsproxy1', 'on'
                   ]

      override.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.module_path    = "puppet/modules"
        puppet.manifest_file  = "tomcat1.pp"
      end
    end

    #==============================
    # PROVIDER: AWS
    #------------------------------
    tomcat1.vm.provider :aws do |aws, override|
      #-- Root account
      override.vm.box     = "precise64"
      override.vm.box_url = "https://ngithub.com/mitchellh/vagrant-aws/raw/master/dummy.box"

      #-- Vagrant account
      aws.instance_type     = "t1.micro"
      aws.access_key_id     = ENV[ 'AWS_ACCESS_KEY' ]
      aws.secret_access_key = ENV[ 'AWS_SECRET_KEY' ]

      aws.keypair_name      = ENV[ 'AWS_KEYPAIR_NAME' ] 
    
      aws.ami               = ENV[ 'AWS_TOMCAT_AMI' ]
      aws.region            = ENV[ 'AWS_REGION' ]
      aws.zone              = ENV[ 'AWS_ZONE' ]
      aws.security_groups   = ENV[ 'AWS_TOMCAT_SECURITY_GROUPS' ]    
      override.ssh.username         = ENV[ 'AWS_USERNAME' ] 
      override.ssh.private_key_path = ENV[ 'AWS_KEY_PATH' ] 
      
      override.vm.provision :shell, :path => "shell/install_puppet.sh"

      override.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.module_path    = "puppet/modules"
        puppet.manifest_file  = "tomcat1.pp"
      end
      override.vm.provision :shell, :path => "shell/print_public_hostname.sh"
    end
  end

  #=============================
  # NODE: Tomcat2 Server
  #-----------------------------
  config.vm.define "tomcat2" do |tomcat2|

    #==============================
    # PROVIDER: VirtualBox
    #------------------------------
    tomcat2.vm.provider :virtualbox do |vb, override|
      # tomcat2.hostmanager.aliases = %w(lb.local lb-alias)
      tomcat2.hostmanager.manage_host       = true
      tomcat2.hostmanager.ignore_private_ip = true
      tomcat2.hostmanager.interface         = "eth1" 

      override.vm.box     = "precise64"
      override.vm.box_url = "http://files/vagrantup.com/precise64.box"

      override.vm.network :public_network, :bridge => ENV[ 'VB_INTERFACE' ] # "virbr0"
      # override.vm.network :private_network, ip: "33.33.33.100"
      override.vm.hostname = "tomcat2.local"
      # override.vm.ssh.timeout   = 300
      # override.vm.ssh.max_tries = 300

      vb.customize [
                    'modifyvm', :id,
                    '--name', 'tomcat2.local',
                    '--natdnshostresolver1', 'on',
                    '--natdnsproxy1', 'on'
                   ]

      override.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.module_path    = "puppet/modules"
        puppet.manifest_file  = "tomcat2.pp"
      end
    end

    #==============================
    # PROVIDER: AWS
    #------------------------------
    tomcat2.vm.provider :aws do |aws, override|
      #-- Root account
      override.vm.box     = "precise64"
      override.vm.box_url = "https://ngithub.com/mitchellh/vagrant-aws/raw/master/dummy.box"

      #-- Vagrant account
      aws.instance_type     = "t1.micro"
      aws.access_key_id     = ENV[ 'AWS_ACCESS_KEY' ]
      aws.secret_access_key = ENV[ 'AWS_SECRET_KEY' ]

      aws.keypair_name      = ENV[ 'AWS_KEYPAIR_NAME' ] 
    
      aws.ami             = ENV[ 'AWS_TOMCAT_AMI' ]
      aws.region          = ENV[ 'AWS_REGION' ]
      aws.zone            = ENV[ 'AWS_ZONE' ]
      aws.security_groups = ENV[ 'AWS_TOMCAT_SECURITY_GROUPS' ] 
      override.ssh.username         = ENV[ 'AWS_USERNAME' ] 
      override.ssh.private_key_path = ENV[ 'AWS_KEY_PATH' ]

      override.vm.provision :shell, :path => "shell/install_puppet.sh"

      override.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.module_path    = "puppet/modules"
        puppet.manifest_file  = "tomcat2.pp"
      end
      override.vm.provision :shell, :path => "shell/print_public_hostname.sh"

    end
  end


  #=============================
  # NODE: LoadBalancer
  #-----------------------------
  config.vm.define "lb" do |lb|

    #==============================
    # PROVIDER: VirtualBox
    #------------------------------
    lb.vm.provider :virtualbox do |vb, override|
      # lb.hostmanager.aliases = %w(lb.local lb-alias)
      lb.hostmanager.manage_host       = true
      lb.hostmanager.ignore_private_ip = true
      lb.hostmanager.interface         = "eth1" 

      override.vm.box     = "precise64"
      override.vm.box_url = "http://files/vagrantup.com/precise64.box"

      # override.vm.network :private_network, ip: "33.33.33.10"
      override.vm.network :public_network, :bridge => ENV[ 'VB_INTERFACE' ] 
      override.vm.hostname = "lb.local"

      vb.customize [
                    'modifyvm', :id,
                    '--name', 'lb.local',
#                    '--natdnshostresolver1', 'on',
#                    '--natdnsproxy1', 'on'
                   ]

      override.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.module_path    = "puppet/modules"
        puppet.manifest_file  = "lb.pp"
      end
    end

    #==============================
    # PROVIDER: AWS
    #------------------------------
    lb.vm.provider :aws do |aws, override|
      #-- Root account
      override.vm.box     = "precise64"
      override.vm.box_url = "https://ngithub.com/mitchellh/vagrant-aws/raw/master/dummy.box"

      #-- Vagrant account
      aws.instance_type     = "t1.micro"
      aws.access_key_id     = ENV[ 'AWS_ACCESS_KEY' ]
      aws.secret_access_key = ENV[ 'AWS_SECRET_KEY' ]

      aws.keypair_name      = ENV[ 'AWS_KEYPAIR_NAME' ] 
      aws.ami               = ENV[ 'AWS_LB_AMI' ]
      aws.region            = ENV[ 'AWS_REGION' ]
      aws.availability_zone = ENV[ 'AWS_ZONE' ]
      aws.security_groups   = ENV[ 'AWS_LB_SECURITY_GROUPS' ]

      override.ssh.username         = ENV[ 'AWS_USERNAME' ]
      override.ssh.private_key_path = ENV[ 'AWS_KEY_PATH' ]

      override.vm.provision :shell, :path => "shell/install_puppet.sh"

      override.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.module_path    = "puppet/modules"
        puppet.manifest_file  = "lb.pp"
      end
      override.vm.provision :shell, :path => "shell/print_public_hostname.sh"
    end
  end

  
end
