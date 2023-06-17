# Class == needrestart::config
class needrestart::config {

  file { $needrestart::config_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/needrestart.conf.erb"),
  }

  unless empty($needrestart::dropin_config_options) {
    file { $::needrestart::dropin_config_dir:
      ensure  => directory,
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      purge   => true,
      recurse => true,
    }
    create_resources('needrestart::dropin', $needrestart::dropin_config_options)
  }
  else {
    file { $::needrestart::dropin_config_dir:
      ensure  => directory,
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      purge   => true,
      recurse => true,
    }    
  }

}
