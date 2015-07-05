class bc-dev-apache {

	class { 'apache':
		default_vhost => false,
		mpm_module    => false
	}

	class {'apache::mod::prefork':
		startservers        => '2',
		minspareservers     => '1',
		maxspareservers     => '2',
		serverlimit         => '8',
		maxclients          => '8',
		maxrequestsperchild => '0',
	}

	include apache::mod::php
	include apache::mod::rewrite

	apache::vhost {
		'bootcamp.incubio.com':
			port          => '80',
			docroot       => '/var/www/app',
			override      => 'All',
			priority      => '20';
	}

}