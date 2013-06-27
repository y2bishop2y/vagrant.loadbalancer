

# set variables
$tomcat_password = '12345'
$tomcat_user = 'tomcat-admin'

class tomcat6 {

  package { "tomcat6":
    ensure => installed,
    require => Package['openjdk-6-jdk'],
  }

  package { "tomcat6-admin":
    ensure => installed,
    require => Package['tomcat6'],
  }
    
  service { "tomcat6":
    ensure  => running,
    require => Package['tomcat6'],
    
  }

  $tomcat_password = '12345'
  $tomcat_user = 'tomcat-admin'

  
  file { "tomcat-users.xml":
    owner   => root,
    path    => "/etc/tomcat6/tomcat-users.xml" ,
    require => Package['tomcat6'],
    notify  => Service['tomcat6'],
    content => template('tomcat6/tomcat-users.xml.erb')

  }
  
  
}
