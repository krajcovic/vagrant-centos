class jmvta::db {

    file { "/var/lib/mysql/create-schema.sql":
        ensure => file,
        source => "puppet:///modules/jmvta/create-schema.sql",
        require => [ Package['mysql-community-server'] ],
    }

    exec { "create database schema":
        command => "/usr/bin/mysql -uroot </var/lib/mysql/create-schema.sql",
        require => [ Service["mysqld"], File["/var/lib/mysql/create-schema.sql"], ],
        unless => '/usr/bin/mysql -uroot jmvta',
        #unless => '/usr/bin/mysql -uroot',
        # before => Exec["migrate database"],
        logoutput => true,
    }

    file { "/var/lib/mysql/allow-access.sql":
        ensure => file,
        source => "puppet:///modules/jmvta/allow-access.sql",
        require => [ Package['mysql-community-server'] ],
    }

    exec { "allow database access":
        command => "/usr/bin/mysql -uroot </var/lib/mysql/allow-access.sql >/var/lib/mysql/allow-access.sql.log",
        require => [ Service["mysqld"], File["/var/lib/mysql/allow-access.sql"], ],
        creates => "/var/lib/mysql/allow-access.sql.log",
        logoutput => true,
    }
}
