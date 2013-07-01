# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  #  config.vm.box = "precise64"
  #config.vm.box_url = "http://files/vagrantup.com/precise64.box"

  #=============================
  #-----------------------------
  config.vm.define "lb" do |lb|

    lb.vm.box     = "precise64"
    lb.vm.box_url = "http://files/vagrantup.com/precise64.box"


    lb.vm.network :private_network, ip: "33.33.33.10"
    lb.vm.hostname = "lb.local"
    # lb.vm.ssh.timeout   = 300
    # lb.vm.ssh.max_tries = 300

    #==============================
    # PROVIDER: VirtualBox
    #------------------------------
    lb.vm.provider :virtualbox do |vb|
      vb.customize [
                    'modifyvm', :id,
                    '--name', 'lb.local'
                   ]
    end

    #==============================
    # PROVIDER: AWS
    #------------------------------
    lb.vm.provider :aws do |aws, override|
      #-- Root account

      #-- Vagrant account
      aws.instance_type     = "t1.micro"
      aws.access_key_id     = ENV[ 'AWS_ACCESS_KEY' ]
      aws.secret_access_key = ENV[ 'AWS_SECRET_KEY' ]

      aws.keypair_name      = 'vagrant'
    
      aws.ami = "ami-70f96e40"

      # aws.region = "us-east-1"
      aws.region = "us-west-1"
    
      override.ssh.username = "ubuntu"
      # override.ssh.private_key_path = "/Users/eberenbaum/.ssh/aws/"
      # override.ssh.private_key_path = "~/.ssh/aws/vagrant.pem"
      override.ssh.private_key_path = "~/.ssh/aws/vagrant.pem"
    end


    lb.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.manifest_file  = "lb.pp"

    end

  end

  #=============================
  #-----------------------------
  config.vm.define "tomcat1" do |tomcat1|
    # tomcat1.vm.box     = "centos-6.3-base-extended-swap"    
    # tomcat1.vm.box_url = "http://asq-vagrant-boxes.s3.amazonaws.com/centos/centos-6.3-base-extended-swap.box"
    tomcat1.vm.box     = "precise64"
    tomcat1.vm.box_url = "http://files/vagrantup.com/precise64.box"


    tomcat1.vm.network :private_network, ip: "33.33.33.50"
    tomcat1.vm.hostname = "tomcat1.local"
    # tomcat1.vm.ssh.timeout   = 300
    # tomcat1.vm.ssh.max_tries = 300

    #==============================
    # PROVIDER: VirtualBox
    #------------------------------
    tomcat1.vm.provider :virtualbox do |vb|
      vb.customize [
                    'modifyvm', :id,
                    '--name', 'tomcat1.local'
                   ]
    end

    #==============================
    # PROVIDER: AWS
    #------------------------------
    tomcat1.vm.provider :aws do |aws, override|
      #-- Root account

      #-- Vagrant account
      aws.instance_type     = "t1.micro"
      aws.access_key_id     = ENV[ 'AWS_ACCESS_KEY' ]
      aws.secret_access_key = ENV[ 'AWS_SECRET_KEY' ]

      aws.keypair_name      = 'vagrant'
    
      aws.ami = "ami-70f96e40"

      # aws.region = "us-east-1"
      aws.region = "us-west-1"
    
      override.ssh.username = "ubuntu"
      # override.ssh.private_key_path = "/Users/eberenbaum/.ssh/aws/"
      # override.ssh.private_key_path = "~/.ssh/aws/vagrant.pem"
      override.ssh.private_key_path = "~/.ssh/aws/vagrant.pem"
    end
    
    tomcat1.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.manifest_file  = "tomcat1.pp"

    end
  end



  #=============================
  #-----------------------------
  config.vm.define "tomcat2" do |tomcat2|

    tomcat2.vm.box     = "precise64"
    tomcat2.vm.box_url = "http://files/vagrantup.com/precise64.box"

    tomcat2.vm.network :private_network, ip: "33.33.33.100"
    tomcat2.vm.hostname = "tomcat2.local"
    # tomcat2.vm.ssh.timeout   = 300
    # tomcat2.vm.ssh.max_tries = 300

    #==============================
    # PROVIDER: VirtualBox
    #------------------------------
    tomcat2.vm.provider :virtualbox do |vb|
      vb.customize [
                    'modifyvm', :id,
                    '--name', 'tomcat2.local'
                   ]
    end


    tomcat2.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.manifest_file  = "tomcat2.pp"


    end

  end


  
end
