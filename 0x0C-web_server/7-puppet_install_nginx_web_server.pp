# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Configure Nginx
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => "
server {
    listen 80 default_server;
    server_name _;

    location /redirect_me {
            return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }

    error_page 404 /404.html;

    location = /404.html{
            internal;
    }
}
",
}

# Enable and start Nginx service
service { 'nginx':
  ensure => running,
  enable => true,
}
