# Automate NGINX Cluster testing 

Project allow automated creation of a VM cluster  with NGINX acting as a load 
balancer infront of two tomcat servers.
Servers uses vagrant to create the VM and pupet to configure 
the VM. Can be run with either a local VirtualBox provider or AWS 

## Requires

* Install [VirtualBox](http://virtualbox.org).
* Install [vagrant](http://vagrantup.com)
* Install Vagrant AWS plugin: 
* install Vagrant AWSInfo plugin: (https://github.com/johntdyer/vagrant-awsinfo)

```
vagrant plugin install vagrant-aws
vagrant plugin install vagrant-awsinfo
```

```
vagrant awsinfo -m <hostName>
```

  
## Install 

* Clone repository 
* `cd vagrant.loadbancer`
* `git submodule init`
* `get submodule update`
* `vagrant up`


## Create first VM 

### Setup

* Go to `http://192.168.5.201` and login  
* Go to `http://192.168.5.201/project/` and select the "demo" project
* Go to `http://192.168.5.201/project/access_and_security` 
* Select the `Security Groups` tab and click on `Edit Rules` for the default group
* Add a rule, protocl TCP from Port 22 To Port 22, and keep all the default values ( this will open the SSH port for VM )
 
#### Make sure to source all the env variables in shell for AWS

```Bash
export AWS_ACCESS_KEY=<copy accounts access key>
export AWS_SESCRET_KEY=<copy secret key>
export AWS_LB_AMI=ami-70f96e40
export AWS_LB_SECURITY_GROUPS="lb-group"
export AWS_TOMCAT_AMI=ami-70f96e40
export AWS_TOMCAT_SECURITY_GROUPS="tomcat-group"
export AWS_USERNAME=ubuntu
export AWS_KEY_PATH="~/.ssh/aws/vagrant.pem"
export AWS_KEYPAIR_NAME="vagrant"
export AWS_REGION="us-west-2"
export AWS_ZONE="us-west-2a"

# Interface used by vagrat-hostmanager to query for Guest IP addresss 
export GUEST_INTERFACE="eth1"

# Interfaced used by Guest to determine Bridge public_network address ( via DHCP )
export BRIDGE_INTERFACE="vbr0"

