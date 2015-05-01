class website {
  $greetname = "Gene"
  
  package { 'apache2':
    ensure  => 'latest',
  }
  service { 'apache2':
    ensure  => 'running',
    enable  => true,
    require => Package['apache2'],
  }
  file { '/var/www/index.html':
    ensure  => 'file',
    content => template('website/index.html.erb'),
    owner   => 'root',
    group   => 'www-data',
    mode    => '0640',
    require => Package['apache2'],
  }
}
