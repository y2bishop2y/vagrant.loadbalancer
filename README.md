# Automate Devstack install

Project allow automated creation of a VM with [devstack](http://www.devstack.org) 
installed and running. It uses vagrant to create the VM and pupet to configure 
the VM. 

## Requires

* Install [VirtualBox](http://virtualbox.org).
* Install [vagrant](http://vagrantup.com)

## Install 

* Clone repository 
* `cd vagrant.devstack`
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
 
#### Make sure to source all the env variables in shell 

```Bash
export OS_TENANT_NAME=admin
export OS_USERNAME=admin
export OS_PASSWORD=admin
export OS_AUTH_URL=http://192.168.5.201:5000/v2.0/
export SERVICE_ENDPOINT=http://192.168.5.201:35357/v2.0/
export SERVICE_TOKEN=ADMIN
```
#### Upload cert to Nova

```Bash
nova keypair-add ${certName} > {certName}.pem
chmod 600 ${certName}
nova boot --image cirros-0.3.0-x86_64 --flavor m1.small --key_name test my-first-server
```

### Create first instance

* Go to `http://192.168.5.201/project/instances/`
* Click "Launch Instance"
* Select "cirros-xxx" in the Image field 
* Choose instance name
* Keep the "m1.tiny" flavor
* In "Access & Security" select the created ${certName} 
* Press "Launch"
* Go back to shell and should be able to ssh using `ssh -i ${certName}.pem -l cirros ${ipAddress}`
