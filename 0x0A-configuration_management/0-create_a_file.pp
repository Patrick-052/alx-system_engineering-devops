# I mananage the file path, owmership and permission

file {'/tmp/school':
    path   => '/tmp/school',
    mode   => '0744',
    owner  => 'www-data',
    group  => 'www-data',
    content => 'I love Puppet'
}
