class bc-dev-base {

	include apt

	class { 'timezone':
		timezone => 'UTC',
		notify   => Service["mysqld"]
	}

	$packages = [ 'pkg-config','libpcre3-dev', 'htop', 'curl' ]

	package { $packages: ensure => 'installed' }

}