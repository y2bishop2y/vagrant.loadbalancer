
class tomcat6::config(
  $application_name = $title,
  $tomcat_port = 8080,
  $tomcat_control_port = 8005,
  $tomcat_admin_user = "tomcat",
  $tomcat_admin_pass = "123456",
  $jmx_registry_port = 10052,
  $jmx_server_port   = 10051,
)
{

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

  # $tomcat_password = '12345'
  # $tomcat_user = 'tomcat-admin'

  $application_root = "/etc/tomcat6"
  $application_dir  = "$application_root"
  
  
  file { "tomcat-users.xml":
    owner   => root,
    path    => "/etc/tomcat6/tomcat-users.xml" ,
    require => Package['tomcat6'],
    notify  => Service['tomcat6'],
    content => template('tomcat6/tomcat-users.xml.erb')

  }

#   file { "servers.xml":
#     owner   => root,
#    path    => "${application_dir}/server.xml",
#    require => Package['tomcat6'],
#    notify  => Service['tomcat6'],
#    content => template('tomcat6/server.xml.erb'),
#  }
    
  
}
