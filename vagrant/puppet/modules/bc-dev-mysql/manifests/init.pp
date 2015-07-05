class bc-dev-mysql {

	class { '::mysql::server':
		root_password    => 'gohf4iekeiph2ohXanei',
		override_options => { 'mysqld' => { 'bind-address' => '0.0.0.0' } }
	}

	mysql_user { 'root@%':
      ensure                   => 'present',
      max_connections_per_hour => '0',
      max_queries_per_hour     => '0',
      max_updates_per_hour     => '0',
      max_user_connections     => '0',
    }

    mysql_grant { 'root@%/*.*':
      ensure     => 'present',
      options    => ['GRANT'],
      privileges => ['ALL'],
      table      => '*.*',
      user       => 'root@%',
    }

	mysql::db { 
		'bootcamp':
			user     => 'bootcamp',
			password => 'goo4ca4jeiThe0Leepie',
			ensure   => 'present',
			charset  => 'utf8',
			host     => 'localhost',
			grant    => ['all'];
	}

}