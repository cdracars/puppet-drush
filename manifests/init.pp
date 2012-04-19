class drush {

  include drush::preferences

  package { 'drush':
    ensure => latest,
    require => File['drush.list'],
  }

  file { "drush.list": 
    path    => "/etc/apt/sources.list.d/drush.list",
    source  => "/tmp/vagrant-puppet/modules-0/drush/files/drush.list", 
    require => Class['drush::preferences'],
  }

}

class drush::preferences {

  file {'/etc/apt/preferences.d/drush.pref':
    ensure => present,
    source => "/tmp/vagrant-puppet/modules-0/drush/files/drush.pref",
  }

}
