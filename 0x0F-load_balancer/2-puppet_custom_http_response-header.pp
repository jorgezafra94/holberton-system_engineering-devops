# commands in puppet in order to configure Nginx with HTTP header

exec {'install-Nginx':
  command    => 'sudo apt update ; sudo apt -y install nginx ; echo "Holberton School" | sudo tee /var/www/html/index.html',
    provider => shell,
    }

exec {'configure HTTP header':
  environment  => ["name=${hostname}"],
    command    => 'sudo sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;/include \/etc\/nginx\/sites-enabled\/\*;\n\t# Adding Header/" /etc/nginx/nginx.conf; sudo sed -i "s/# Adding Header/# Adding Header \n\tadd_header X-Served-By $name;/" /etc/nginx/nginx.conf; sudo serv\
    ice nginx restart',
      provider => shell,
}