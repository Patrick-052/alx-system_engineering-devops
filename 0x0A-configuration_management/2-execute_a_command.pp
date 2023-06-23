# Executing a kill command => 'killmenow'

exec { 'killmenow':
  command => 'pkill killmenow',
  path    => '/usr/bin:/bin',
}

