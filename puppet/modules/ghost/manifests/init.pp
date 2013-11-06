class ghost( $ghost_root = '/srv/blog'
           , $ghost_user = 'ghost'
           , $ghost_group = 'ghost'
           ) {
  # does ghost exist at the specified folder
    # no
      # install ghost
    # yes
      # fail

  group { $ghost_group:
    ensure => present,
  }

  user { $ghost_user:
    gid => $ghost_group,
    managehome => true,
  }

  file { ['/srv', '/srv/blog']:
    ensure => directory,
    owner => $ghost_user,
  }

  file { '/etc/init.d/ghost':
    ensure => present,
    mode => 0555,
    content => template('ghost/init.d/ghost.erb'),
  }

  file { "$ghost_root/ghost.zip":
    require => File[$ghost_root],
    ensure => present,
    source => 'puppet:///modules/ghost/ghost-0.3.3.zip',
  }

  exec { 'extract ghost':
    subscribe => File['/srv/blog/ghost.zip'],
    cwd => $ghost_root,
    path => ['/usr/bin'],
    creates => "$ghost_root/index.js",
    user => $ghost_user,
    command => 'unzip ghost.zip',
  }

  exec { 'npm install':
    require => Exec['extract ghost'],
    cwd => $ghost_root,
    path => ['/usr/local/sbin','/usr/local/bin','/usr/sbin','/usr/bin','/sbin','/bin'],
    creates => "$ghost_root/node_modules",
    environment => ["HOME=$ghost_root"],
    user => $ghost_user,
    command => 'npm install --production',
  }
}