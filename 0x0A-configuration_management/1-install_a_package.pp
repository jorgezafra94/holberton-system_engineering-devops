# install puppet-lint using a command
# ensure is like version
package { 'puppet-lint':
  ensure   => '2.1.1',
  provider => 'gem',
}
