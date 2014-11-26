class jmvta::test_data {

    
    file { "/var/lib/mysql/test_data.xml":
      ensure => file,
      source => "puppet:///modules/jmvta/test_data.xml",
	    require => [ Package['mysql-community-server'], Package['liquibase-mysql'], ],
    }

   exec { "test data":
        command => '/usr/bin/liquibase --changeLogFile="/var/lib/mysql/test_data.xml" --url="jdbc:mysql://localhost/asl_data" --username="root" --password="" migrate',
        require => [ Service["mysql"], Package['liquibase-mysql'], Exec["migrate database"] ],
        subscribe => [ File["/var/lib/mysql/test_data.xml"], ],
        refreshonly => true,
        logoutput => true,
    }

}
