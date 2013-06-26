
class tomcat7 {
  include tomcat7::jpackage_repo


  package { "tomcat7":
    ensure => installed,
  }
  -> file { "/var/log/tomcat7":
    ensure  => directory,
    mode    => 0775,
    owner   => "root",
    group   => "tomcat",
  }
  -> file { "/var/cache/tomcat7/temp":
    ensure => directory,
    mode   => 0775,
    owner  => "root",
    group  => "tomcat",
  }
  -> file { "/var/lib/tomcat7/webapps":
    ensure => directory,
    mode   => 0775,
    owner  => "root",
    group  => "tomcat7",
  }
  -> service { "tomcat7":
    ensure  => running,
    require => [Package['tomcat7']]
  }
}
