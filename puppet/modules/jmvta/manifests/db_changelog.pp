class jmvta::db_changelog {

    package { "liquibase-mysql":
      ensure => latest,
      require => Yumrepo["smartshop"],
    }

    file { "/var/lib/mysql/db.changelog.xml":
      ensure => file,
      source => "puppet:///modules/jmvta/db.changelog.xml",
	    require => [ Package['mysql-community-server'] ],
    }

   exec { "migrate database":
        command => '/usr/bin/liquibase --logLevel=info --changeLogFile="/var/lib/mysql/db.changelog.xml" --url="jdbc:mysql://localhost/jmvta" --username="root" --password="" migrate',
        require => [ Service["mysqld"], Package['liquibase-mysql'], ],
        subscribe => [ Exec["create database schema"], File["/var/lib/mysql/db.changelog.xml"], ],
        refreshonly => true,
        logoutput => true,
    }

}
