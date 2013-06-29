#===========================
#---------------------------
stage { [pre, post]: }

Stage[pre] -> Stage[main] -> Stage[post]

class { apt-hupdate: stage => pre }

include tree
include python
include nginx
include emacs 

#--- Have to figure out 
# include iptables::disable
# include iscsid::disable


nginx::config::cluster { 'test':
  servers => [
              '33.33.33.50.:8080',
              '33.33.33.100:8080'
               ]
}

nginx::config::vhost { 'lb.local':
  cluster => 'test',
}



