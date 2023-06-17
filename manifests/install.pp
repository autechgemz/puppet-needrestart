# == Class: needrestart::install
class needrestart::install {
  package { $needrestart::package_name:
    ensure          => $needrestart::package_ensure,
    install_options => $needrestart::install_options,
  }
}
