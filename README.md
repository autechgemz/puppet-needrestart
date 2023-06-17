# puppet-needrestart

A puppet module for needrestart installing and configration.

## Compatibility

* Ubuntu 22.04
* puppet version >= 4.0.0
* puppetlabs-stdlib >= 4.25.1

## Example

### Class

```
class { 'needrestart':
  dropin_config_options = {
    'override.conf' => {
      ensure  => 'present',
      content => {
        'defno'   => 1,
        'restart' => 'a',
      }
    }
  }
}
```

### Hiera

```
needrestart::dropin_config_options:
  override.conf:
    ensure: 'present'
    content:
      defno: 1
      restart: 'a'
```
