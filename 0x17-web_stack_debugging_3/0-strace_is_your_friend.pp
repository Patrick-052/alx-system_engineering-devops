# Tracing bugs using [strace] command and debugging them ensuring
# apache2 runs smoothly when requested for a webpage

# Ensuring apache is installed
package {'apache2':
  ensure  => installed,
}

# Creating the missing file
file {'/var/www/html/index.html':
  ensure  => present,
  content => '<title>Holberton &#8211; Just another WordPress site</title>
<link rel="alternate" type="application/rss+xml" title="Holberton &raquo; Feed" href="http://127.0.0.1/?feed=rss2" />
<link rel="alternate" type="application/rss+xml" title="Holberton &raquo; Comments Feed" href="http://127.0.0.1/?feed=comments-rss2" />
        <div id="wp-custom-header" class="wp-custom-header"><img src="http://127.0.0.1/wp-content/themes/twentyseventeen/assets/images/header.jpg" width="2000" height="1200" alt="Holberton" /></div>  </div>
                            <h1 class="site-title"><a href="http://127.0.0.1/" rel="home">Holberton</a></h1>
        <p>Yet another bug by a Holberton student</p>',
}

# Restarting apache
service {'apache2':
  ensure  => running,
  enable  => true,
  require => Package['apache2'],
}
