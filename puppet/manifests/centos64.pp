group { "puppet":
        ensure => "present",
}

# Modules 

class { "mongodb":
	  enable_10gen => true,
}
class { "jdk": } 
class { "tomcat": } 

# Stop Firewall
service { "iptables":
  	ensure => stopped,
}


# Mongo Backup
file { "/var/data/mongo":
       ensure=>directory,
}
cron { mongodump:
       command => "/usr/bin/mongodump -o /var/data/mongo",
       minute => '*/5',
       require => [File["/var/data/mongo"], Class["mongodb"]],
}
