stage { pre: before => Stage[main] }

$server0_ip                = "192.168.1.10"
$server1_ip                = "192.168.1.11"
$server2_ip                = "192.168.1.12"

#MYSQL
$mysql_user                      = "cent"
$mysql_user_pwd                  = "cent"
$mysql_schema                    = "cent"
$mysql_replication_user          = "repl"
$mysql_replication_user_password = "slavepass"


include env
#include mongo

node 'node0' {
	class { 'mysql::server': mysql_server_id => 1, mysql_master_ip => $server0_ip }
	#include jmvta
	#include jmvta::db
	#include jmvta::db_changelog
}

node 'node1' {
	#include jmvta::worker
}

#node 'node2' {
	#include mysql
#}
