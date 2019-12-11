#!/usr/bin/env bash
#commands in puppet in order to configure our Nginx
exec {'install':
  command  => 'sudo apt-get -y update; sudo apt-get -y install nginx',
  provider => shell,
}
exec {'content index':
  command  => 'echo "Holberton School" |sudo tee /var/www/html/index.html',
  provider => shell,
}
exec {'config in default':
  command  => 'cd /etc/nginx/sites-available/ && var="server_name _;\n\trewrite ^\/redirect_me https:\/\/www.youtube.com\/watch?v=QH2-TGUlwu4 permanent;"|sudo sed -i "s/server_name _;/$var/" default && cd -',
  provider => shell,
}
exec {'restart':
  command  => 'sudo service nginx restart',
  provider => shell,
}