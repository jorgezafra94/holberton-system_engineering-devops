#commands in puppet in order to configure our Nginx
exec {'install':
  command  => 'sudo apt-get -y update; sudo apt-get -y install nginx',
  provider => shell,
}
file {'/var/www/html/index.html':
  path    => '/var/www/html/index.html',
  content => 'Holberton School',
}
file_line {'redirection':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'server_name _;',
  line   => "\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;",
}
exec {'restart Nginx':
  command  => 'sudo service nginx restart',
  provider => shell,
}