# fix wordpress
# adding log to wp-config in order to get the problem
# exec {'add':
#   command  => 'sudo sed -i "40i\define(\'WP_DEBUG\', true);\ndefine(\'WP_DEBUG_LOG\', true);\n" /var/www/html/wp-config.php',
#   provider => shell,
# }
# run  curl -sI 127.0.0.1
# get log from /var/www/html/wp-content/debub.log
# replace the line 137 cuz there is a file.phpp not file.php

exec {'add':
  command  => 'sudo sed -i "s/.phpp/.php/" /var/www/html/wp-settings.php',
  provider => shell,
}
