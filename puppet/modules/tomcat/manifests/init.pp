class tomcat {

include jpackage

notify { "tomcat module":
	 message => "Running module tomcat",
}

package { "tomcat7":
	  ensure => installed,
	  require => Notify["tomcat module"],
}

service { "tomcat7":
	  ensure => 'running',
	  require => Package['tomcat7'],
}

}
