class bc-dev-php {

	include php
	include php::dev

	class { [
		'php::apache',
		'php::cli',
		'php::composer',
		'php::extension::curl',
		'php::extension::mcrypt',
		'php::extension::xdebug',
		'php::extension::gd',
		'php::extension::mysqlnd',
		'php::extension::redis']:
	}->

	# Configure XDEBUG
	php::apache::config { 'xdebug.remote_enable = on':
		file => '/etc/php5/mods-available/xdebug.ini',
		section=> ''
	}->
	php::apache::config { 'xdebug.remote_handler = dbgp':
		file => '/etc/php5/mods-available/xdebug.ini',
		section=> ''
	}->
	php::apache::config { 'xdebug.remote_connect_back = on':
		file => '/etc/php5/mods-available/xdebug.ini',
		section=> ''
	}->
	php::apache::config { 'xdebug.profiler_enable_trigger = 1':
		file => '/etc/php5/mods-available/xdebug.ini',
		section=> ''
	}->
	php::apache::config { 'xdebug.profiler_output_name = %H.%R.%t.xt':
		file => '/etc/php5/mods-available/xdebug.ini',
		section=> ''
	}->
	php::apache::config { 'xdebug.profiler_output_dir = "/var/www/profiler"':
		file => '/etc/php5/mods-available/xdebug.ini',
		section=> ''
	}

	# Force UTC Time everywhere
	php::apache::config { 'apache_date_timezone':
		setting => 'date.timezone',
		value   => 'UTC',
		section => 'Date',
	}

	php::cli::config { 'cli_date_timezone':
		setting => 'date.timezone',
		value   => 'UTC',
		section => 'Date',
	}

	# Install and configure MongoDB Driver
	php::extension { 'mongo':
		ensure   => '1.6.10',
		package  => 'mongo',
		provider => 'pecl',
		pipe     => 'no';
	}->

	file { "/etc/php5/apache2/conf.d/20-mongo.ini":
		owner   => "root",
		group   => "root",
		mode    => 644,
		source  => 'puppet:///modules/bc-dev-php/mongo.ini',
		notify  => Service["httpd"]
	}->

	file { "/etc/php5/cli/conf.d/20-mongo.ini":
		owner   => "root",
		group   => "root",
		mode    => 644,
		source  => 'puppet:///modules/bc-dev-php/mongo.ini',
		notify  => Service["httpd"]
	}

	# Workaround a bug into Ubuntu mcrypt package
	exec {
		"enable_extensions":
			command => 'php5enmod mcrypt',
			path    => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
			require => Class['php::extension::mcrypt'],
			notify  => Service["httpd"]
	}
}