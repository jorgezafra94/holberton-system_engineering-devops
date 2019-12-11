# commands in puppet in order to configure our Nginx
exec {'install':
  command  => 'sudo apt update && sudo apt -y install nginx',
  provider => shell,
}
exec {'content index':
  command  => 'echo "Holberton School" |sudo tee /var/www/html/index.html',
  provider => shell,
}
exec {'config in default':
  command  => 'sudo sed -i "s/server_name _;/server_name _;\n\trewrite ^\/redirect_me https:\/\/www.youtube.com\/watch?v=QH2-TGUlwu4 permanent;/" /etc/nginx/sites-available/default',
  provider => shell,
}
exec {'restart Nginx':
  command  => 'sudo service nginx restart',
  provider => shell,
}
