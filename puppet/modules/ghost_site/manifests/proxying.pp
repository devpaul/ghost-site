class ghost_site::proxying {
  class { 'nginx': }
  nginx::resource::upstream { 'puppet_rack_app':
    ensure  => present,
    members => ['localhost:2368'],
  }

  nginx::resource::vhost { '127.0.0.1':
    ensure   => present,
    proxy  => 'http://puppet_rack_app',
  }
}