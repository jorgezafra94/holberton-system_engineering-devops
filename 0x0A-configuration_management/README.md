*Configuration Management (Puppet)*

INSTALL Puppet:

* package { 'puppet-lint':
  ensure   => '1.1.0',
  provider => 'gem',
}

* gem install puppet-lint

RUN:
* puppet-lint /ubication/file

FIX:
* puppet-lint --fix /ubication/file


we are going to solve:

0- Using Puppet, create a file in /tmp.

Requirements:

File path is /tmp/holberton
File permission is 0744
File owner is www-data
File group is www-data
File contains I love Puppet

1- Using Puppet, install puppet-lint.

Requirements:

Install puppet-lint
Version must be 2.1.1

2- Using Puppet, create a manifest that kills a process named killmenow.

Requirements:

Must use the exec Puppet resource
Must use pkill
