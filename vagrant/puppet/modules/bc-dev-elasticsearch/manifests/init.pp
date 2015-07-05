class bc-dev-elasticsearch {

	class { 'elasticsearch':
		manage_repo  => true,
		repo_version => '1.6',
		java_install => true,
	}

	elasticsearch::instance { 'bootcamp': }
}