# == Define needrestart::dropin
#
# === Parameters:
# [*ensure*]
# [*dropin_title*]
# [*content*]
#
define needrestart::dropin (
  Enum['present', 'absent'] $ensure = 'present',
  String $dropin_title              = $name,
  Optional[Hash] $content           = undef
) {
  $dropin_filename = regexpescape($dropin_title)
  unless empty($content) {
    file { "${dropin_filename}.conf":
      ensure  => $ensure,
      path    => "${needrestart::dropin_config_dir}/${dropin_title}.conf",
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("${module_name}/override.conf.erb"),
    }
  }
}
