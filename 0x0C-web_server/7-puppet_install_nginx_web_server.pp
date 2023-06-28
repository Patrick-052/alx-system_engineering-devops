package { 'nginx':
  ensure   => installed,
  provider => 'apt',
}

file_line { 'default_listen':
  path    => '/etc/nginx/sites-available/default',
  line    => 'listen 80 default_server;',
  match   => 'listen 80 default_server',
  require => Package['nginx'],
}

file_line { 'default_redirect':
  path    => '/etc/nginx/sites-available/default',
  line    => 'location /redirect_me {',
  match   => 'location / {',
  require => Package['nginx'],
}

file_line { 'redirect_return':
  path    => '/etc/nginx/sites-available/default',
  line    => 'return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;',
  match   => 'location /redirect_me {',
  require => Package['nginx'],
}

file_line { 'default_end':
  path    => '/etc/nginx/sites-available/default',
  line    => '}',
  match   => 'server {',
  require => [Package['nginx'], File_line['redirect_return']],
}

file { '/var/www/html/index.html':
  ensure  => present,
  content => 'Hello World!',
  require => Package['nginx'],
}
