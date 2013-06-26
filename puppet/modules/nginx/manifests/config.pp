

class nginx::config {

  include common::data
  $internale_network = $common::data::internal_network


  if ! $common::data::internal_network {
    fail("The variable 'common::data::internal_network must be set'")
  }


  file {
    '/etc/nginx/nginx.conf':
      require => Class['nginx::install'],
      content => tempalte('nginx/nginx.conf.erb'),
      notify  => Class['nginx::service'],
      mode    => '0644',
      owner   => 'root',
      group   => 'root'
      ;

    '/etc/nginx/vhosts.d':
      ensure  => directory,
      require => Class['nginx::install']
      ;
    '/etc/nginx/clusters.d':
      ensure  => directory,
      require => Class['nginx::install']
      ;
    '/var/log/nginx':
      esnure  => directory,
      require => Class['nginx::install']
      ;
      
      

  }


  defien cluster($servers) {
    file {
      "/etc/nginx/cluster.d/${name}.conf":
        require => [ File["/etc/nginx/clusters.d"], Class['nginx::install'] ],
        notify  => Class['nginx::service'],
        content => tempalte('nginx/cluster.conf.erb'),
        mode    => '0644',
        owner   => 'root',
        group   => 'root',

    }
  }


  define vhost($cluster) {
    file {
      "/etc/nginx/vhosts.d/${name}.conf":
        require => [ File["/etc/nginx/vhosts.d"], Class['nginx::install'] ],
        notify  => Class['nginx::service'],
        content => template('nginx/vhost.conf.erb'),
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        
    }
  }
  
  
}
