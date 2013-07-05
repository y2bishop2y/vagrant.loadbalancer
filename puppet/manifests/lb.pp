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


nginx::config::cluster { 'tomcat_cluster':
  servers => [
              'tomcat1.local:8080',
              'tomcat2.local:8080'
               ]
}

nginx::config::vhost { 'tomcat.local':
  cluster => 'tomcat_cluster',
}



