class jmvta {

	$application_name = 'jmvta'

    file { [ "/opt/$application_name" ]:
		ensure => directory,
    }

    file { "/etc/default/$application_name":
		owner => 'root',
		mode   => 0644,
		content => template("$application_name/defaults.erb"),
    }
  }
