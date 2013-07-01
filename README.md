# Automate NGINX Cluster testing 

Project allow automated creation of a VM cluster  with NGINX acting as a load 
balancer infront of two tomcat servers.
Servers uses vagrant to create the VM and pupet to configure 
the VM. Can be run with either a local VirtualBox provider or AWS 

## Requires

* Install [VirtualBox](http://virtualbox.org).
* Install [vagrant](http://vagrantup.com)
* Install Vagrant AWS plugin: 
```
vagrant plugin install vagrant-aws
```
  
## Install 

* Clone repository 
* `cd vagrant.loadbancer`
* `git submodule init`
* `get submodule udpate`
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
```
#### Upload cert to Nova

```Bash
nova keypair-add ${certName} > {certName}.pem
chmod 600 ${certName}
```

### Create first instance

* Go to `http://33.33.33.10/`
