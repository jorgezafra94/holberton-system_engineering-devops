#commands in puppet in order to configure our Nginx
package {'nginx':
  ensure => 'installed',
}
file {'/var/www/html/index.html':
  path    => '/var/www/html/index.html',
  content => 'Holberton School',
}
file_line { 'redirection':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'server_name _;',
  line   => "\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;",
  notify  => Service['nginx'],
}
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}
