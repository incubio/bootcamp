
node 'bootcamp.incubio.com' {

	class {'bc-dev-base':} ->

	class {'bc-dev-apache':} ->

	class {'bc-dev-mysql':} ->

	class {'bc-dev-php':}

	class {'bc-dev-redis':}

	class {'bc-dev-elasticsearch':}

	class {'bc-dev-nodejs':}

	class {'bc-dev-mongodb':}
}
