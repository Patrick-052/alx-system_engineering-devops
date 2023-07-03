# Creating custom headers for a Http server response

package { 'nginx':
  ensure  =>  installed,
}

file { '/etc/nginx/sites-available/default':
  ensure  =>  present,
  content =>  "
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/html;
    index index.html;
    add_header X-Served-By ${hostname};
}
",
}

exec { 'run'
  command => '/usr/sbin/service nginx restart',
}
