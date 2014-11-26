class jmvta::worker {

    $application_name = 'jmvta'

    package { 'jdk1.8.0_25':
		ensure => latest,
		require => Yumrepo ['smartshop'],
	}

  package { 'jmvta-worker':
		 ensure => latest,
		 require => [Package['jdk1.8.0_25'],Yumrepo["monet-releases"], Yumrepo["monet-snapshots"],],
		 notify => Service['jmvta-worker'],
    }

    service { "jmvta-worker":
		enable => true,
		ensure => running,
		require => Package['jmvta-worker']
    }
   
    file { '/var/log/worker.log':
        ensure => link,
        target => '/opt/jmvta/jmvta-worker/log/worker.log',
        require => Service['jmvta-worker'],
    }

    file { "/opt/$application_name/jmvta-worker/conf/default.properties":
        owner => 'root',
        mode   => 0644,
        content => template("jmvta/default.properties.erb"),
        require => Package['jmvta-worker'],
        before => Service['jmvta-worker'],
    }

}
