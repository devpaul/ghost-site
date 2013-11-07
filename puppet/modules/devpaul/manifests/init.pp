class devpaul {
  class { 'requirements': }
  class { '::nodejs':
    version => 'stable',
    require => Class['requirements'],
  }->
  package { 'forever':
    provider => npm
  }
  class { 'ghost':
    require => Class['nodejs'],
  }
  class { 'proxying':
    require => Class['requirements'],
  }
}