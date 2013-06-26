#===========================
#---------------------------
stage { [pre, post]: }

Stage[pre] -> Stage[main] -> Stage[post]

class { apt-hupdate: stage => pre }

include tree
include python
include nginx
include emacs 

include iptables::disable
include iscsid::disable


nginx::config::cluster { 'test':
  servers => [
               '33.33.33.50.:8082',
               ]

}

nginx::config::vhost { 'lb.local':
  cluster => 'test',
}



