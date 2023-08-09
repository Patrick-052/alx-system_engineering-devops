# Using [strace] to trace bugs and fixing them for 
# smooth running of apache2 

$file_to_edit = '/var/www/html/wp-settings.php'

# replace line containing "phpp" with "php"
exec { 'replace_line':
  command => "sed -i 's/phpp/php/g' ${file_to_edit}",
  path    => ['/bin','/usr/bin']
}
