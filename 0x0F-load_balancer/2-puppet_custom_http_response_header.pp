# Creating custom headers for a Http server response

file { '/etc/nginx/sites-available/default':
  ensure  =>  present,
  content =>  "
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/html;
    index index.html;
    location /redirect_me {
       return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }
    error_page 404 /404.html;
    location = /404.html{
       internal;
    }
    location / {
       # First attempt to serve request as file, then
       # as directory, then fall back to displaying a 404.
       try_files ${uri} ${uri}/ =404;
       # Adding a custom header
       add_header X-Served-By '194200-web-01';
    }
}
",
}
