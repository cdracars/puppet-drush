class drush {

  include drush::preferences

  package { 'drush':
    ensure => latest,
    require => File['drush.list'],
  }

  file { "drush.list": 
    path    => "/etc/apt/sources.list.d/drush.list",
    source  => "puppet:///modules/drush/files/drush.list", 
    require => Class['drush::preferences'],
  }

}

class drush::preferences {

  file {'/etc/apt/preferences.d/drush.pref':
    ensure => present,
    source => "puppet:///modules/drush/files/drush.pref",
  }

}
