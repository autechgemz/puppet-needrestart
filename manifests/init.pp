# Class == needrestart
#
# Requires:
# puppetlabs-stdlib
#
# Parameters:
# [*ensure*]
# [*package_name*]
# [*package_ensure*]
# [*install_options*]
# [*config_dir*]
# [*config_file*]
# [*config_options*]
# [*dropin_config_dir*]
# [*dropin_config_options*]
#
class needrestart (
  String               $ensure,
  Array[String]        $package_name,
  String               $package_ensure,
  Array[String]        $install_options,
  Stdlib::Absolutepath $config_dir,
  Stdlib::Absolutepath $config_file,
  Optional[Hash]       $config_options,
  Stdlib::Absolutepath $dropin_config_dir,
  Optional[Hash]       $dropin_config_options,
) {
  if ($facts['os']['name'] != 'Ubuntu') or
    ($facts['os']['name'] == 'Ubuntu' and versioncmp($facts['os']['release']['major'],'21',true) < 0) {
    fail('Unsupport operating system.')
  }
  contain needrestart::install
  contain needrestart::config
  Class['needrestart::install'] -> Class['needrestart::config']

}
