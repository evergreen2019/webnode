# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include webnode
class webnode {
file { '/appfs/webnode':
    ensure => 'directory',
    owner  => 'www-data',
    group  => 'www-data',
    mode   => '0755',
  }
file { '/appfs/webnode':
    ensure  => present,
    mode    => '0755',
    source => "puppet:///modules/webnode/${::hostname.js}",
  }
  exec { 'noderun':
    command => 'node /appfs/webnode/${::hostname.js}',
    path    => '/usr/local/bin/:/bin/',
    # path    => [ '/usr/local/bin/', '/bin/' ],  # alternative syntax
  }


}
