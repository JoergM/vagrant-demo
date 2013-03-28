group { "puppet":
        ensure => "present",
}

file { "/var/data/mongo":
		   ensure=>directory,
}

cron { mongodump:
			command => "/usr/bin/mongodump -o /var/data/mongo",
			minute => '*/5',
			require => [File["/var/data/mongo"], Class["mongodb"]],
}

service { "iptables":
					ensure => stopped,
}

class { "mongodb":
	  enable_10gen => true,
}

class { "jdk": } 
