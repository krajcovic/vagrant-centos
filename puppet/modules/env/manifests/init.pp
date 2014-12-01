class env {

    include resolver

    group { "puppet": ensure => "present" }

    File { owner => 0, group => 0, mode => 0644 }

    file { '/etc/motd':
	content => "Welcome to your CentOS 6.5 $hostname VM!
		    Managed by Puppet.\n"
    }

    resolv_conf { "nitrok":
	  domainname  => "nitrok.cz",
	  searchpath  => ['nitrok.cz'],
	  nameservers => ['192.168.10.1'],
     }

 #    host { 'gerald':
	# ip => '172.27.170.70',
	# host_aliases => [ 'gerald.monetplus.cz', ],
	# ensure => present,
 #    }

    service { "iptables":
	enable => false,
	ensure => stopped,
    }

 #    yumrepo { "redhat-server":
	# baseurl => "https://w3test.monetplus.cz/~urepo/rhel6_64/rhel-6-server-rpms",
	# descr => "RedHat Server repository",
	# enabled => 1,
	# gpgcheck => 0,
	# protect => 0,
 #    }

 #    yumrepo { "rhel6updateHA":
	# baseurl => "https://w3test.monetplus.cz/~urepo/rhel6_64/rhel-ha-for-rhel-6-server-rpms",
	# descr => "RedHat update HA",
	# enabled => 1,
	# gpgcheck => 0,
	# protect => 0,
 #    }

 #    yumrepo { "rhel6updateLB":
	# baseurl => "https://w3test.monetplus.cz/~urepo/rhel6_64/rhel-lb-for-rhel-6-server-rpms",
	# descr => "RedHat update LB",
	# enabled => 1,
	# gpgcheck => 0,
	# protect => 0,
 #    }

 #    yumrepo { "rhel6updateRS":
	# baseurl => "https://w3test.monetplus.cz/~urepo/rhel6_64/rhel-rs-for-rhel-6-server-rpms",
	# descr => "RedHat update RS",
	# enabled => 1,
	# gpgcheck => 0,
	# protect => 0,
 #    }

 #    yumrepo { "rhel6updateSJIS":
	# baseurl => "https://w3test.monetplus.cz/~urepo/rhel6_64/rhel-sjis-for-rhel-6-server-rpms",
	# descr => "RedHat update SJIS",
	# enabled => 1,
	# gpgcheck => 0,
	# protect => 0,
 #    }

 #    yumrepo { "redhat-server":
	# baseurl => "http://gerald.monetplus.cz/os/redhat/rhel6upd4_64/os/Server",
	# descr => "RedHat Server repository",
	# enabled => 1,
	# gpgcheck => 0,
	# protect => 0,
 #    }

 #    yumrepo { "monet-releases":
	# baseurl => "http://maven.monetplus.cz/content/groups/public",
	# descr => "Monet Maven Release Repository",
	# enabled => 1,
	# gpgcheck => 0,
	# protect => 0,
	# metadata_expire => 30s,
 #    }

 #    yumrepo { "monet-snapshots":
	# baseurl => "http://maven.monetplus.cz/content/groups/public-snapshots",
	# descr => "Monet Maven snapshot Repository",
	# enabled => 1,
	# gpgcheck => 0,
	# protect => 0,
	# metadata_expire => 30s,
 #    }

 #    yumrepo { "smartshop":
	# baseurl => "http://gerald.monetplus.cz/smartshop",
	# descr => "Smartshop",
	# enabled => 1,
	# gpgcheck => 0,
	# protect => 0,
	# metadata_expire => 30s,
 #    }

    yumrepo { "mysql-connectors-community":
	baseurl => "http://repo.mysql.com/yum/mysql-connectors-community/el/6/x86_64/",
	descr => "MySQL Connectors Community",
	enabled => 1,
	gpgcheck => 0,
	protect => 0,
    }

    yumrepo { "mysql-tools-community":
	baseurl => "http://repo.mysql.com/yum/mysql-tools-community/el/6/x86_64/",
	descr => "MySQL Tools Community",
	enabled => 1,
	gpgcheck => 0,
	protect => 0,
    }

    yumrepo { "mysql-56-community":
	baseurl => "http://repo.mysql.com/yum/mysql-5.6-community/el/6/x86_64/",
	descr => "MySQL 56 Community",
	enabled => 1,
	gpgcheck => 0,
	protect => 0,
    }

    # exec { "system-update":
    # 	 command => "/usr/bin/yum -y -q update",
    # }
}
