class ghost_site::requirements {
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }

  Exec["apt-update"] -> Package <| |>

  package { [ git-core
            , build-essential
            , libssl-dev
            , unzip
            , vim
            , sendmail
            ]:
          }
}