class jmvta::hazelcast {

    package { 'jmvta-hazelcast':
	ensure => installed,
	require => Package['jdk-env'],
    }

    file {
	[ "/opt/hazelcast/bin/startup.sh", "/opt/hazelcast/bin/shutdown.sh", "/opt/hazelcast/bin/hazelcast.init"  ]:
	owner => 'root',
	mode   => 0755,
	before => Service['hazelcast'],
    }

    file { "/opt/hazelcast/conf/hazelcast.xml":
	owner => 'root',
	mode   => 0644,
	require => Package['jmvta-hazelcast'],
	content => template('jmvta/hazelcast/hazelcast.xml.erb'),
	before => Service['hazelcast'],
    }

    file { "/opt/hazelcast/bin/defaults":
	owner => 'root',
	mode   => 0644,
	require => Package['jmvta-hazelcast'],
	content => template('jmvta/hazelcast/defaults.erb'),
	before => Service['hazelcast'],
    }

    service { "hazelcast":
	enable => true,
	ensure => running,
	require => Package['jmvta-hazelcast'],
    }
}
