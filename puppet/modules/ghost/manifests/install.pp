define ghost::install ( $version = undef
                      , $target = undef
                      , $user = 'ghost'
                      , $group = 'ghost'
                      ) {
  include ghost::params

  $ghost_version = $version ? { undef => $::ghost_stable_version
                              , 'stable' => $::ghost_stable_version
                              , default => $version
                              }
}