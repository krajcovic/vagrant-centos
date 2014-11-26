class mysql::server($mysql_server_id, $mysql_master_ip) {

    package { "libaio":
	ensure => installed,
	require => [ Yumrepo["redhat-server"], Yumrepo["mysql-56-community"], ],
    }
  
 #    package { "MySQL-shared-compat":
	# ensure => latest,
	# require => Yumrepo["mysql-56-community"],
 #    }

    package { "mysql-libs":
	ensure => purged,
	before => [ Package['mysql-community-server'] ],
    }

    package { "mysql-community-server":
	ensure => latest,
	#require => [ Package['libaio'], Package['MySQL-shared-compat'], Yumrepo["mysql-56-community"], ],
	require => [ Package['libaio'], Yumrepo["mysql-56-community"], ],
	before => [ File['/etc/my.cnf'] ],
    }

    package { "mysql-community-client":
	ensure => latest,
	require => Yumrepo["mysql-56-community"],
    }

    file { "/etc/my.cnf":
	owner => "mysql", group => "mysql",
	ensure => file,
	content => template('mysql/my.cnf.erb'),
	notify => Service["mysqld"],
    }

    service { "mysqld":
	enable => true,
	ensure => running,
	require => [ Package['mysql-community-server'], File['/etc/my.cnf'] ],
    }

    # REPLICATION

    file { "/var/lib/mysql/replication.sql":
	ensure => file,
	content => template('mysql/replication.sql.erb'),
	require => [ Package['mysql-community-server'] ],
    }

    exec { "initialize replication":
	command => "/usr/bin/mysql -uroot </var/lib/mysql/replication.sql >/var/lib/mysql/replication.sql.initialized",
	require => [ Package['mysql-community-client'], Service["mysqld"], File["/var/lib/mysql/replication.sql"], ],
	creates => "/var/lib/mysql/replication.sql.initialized",
    }
}
