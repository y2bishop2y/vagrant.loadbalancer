#===========================
#---------------------------
stage { [pre, post]: }

Stage[pre] -> Stage[main] -> Stage[post]

class { apt-hupdate: stage => pre }


include tree
include python


class requirements {
  include sysconfig
  include sysconfig::sudoers
  include ssh::server


  group { "vagrant":
    ensure => 'present',
  }

  user { "vagrant":
    ensure  => 'present',
    gid     => 'vagrant',
    require => Group['vagrant']
  } -> file { "/home/vagrant" :
  ensure => directory,
  owner  => vagrant
  }

  ssh::user { "vagrant": }
  
  # user and group puppet necessary for rvm
  group { "puppet":
    ensure => 'present',
  }
  user { "puppet":
    ensure  => 'present',
    gid     => 'puppet',
    require => Group['puppet']
  }
}
