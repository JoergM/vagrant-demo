class tomcat {

include jpackage

notify { "tomcat module":
	 message => "Running module tomcat",
}

package { "tomcat7":
	  ensure => installed,
	  require => Notify["tomcat module"],
}

file {"/etc/sysconfig/tomcat7":
  owner => root,
  group => root,
  mode => 644,
  source => 'puppet:///modules/tomcat/tomcat7',
  require => Package['tomcat7'],
}

service { "tomcat7":
	  ensure => 'running',
	  require => File['/etc/sysconfig/tomcat7'],
}

}
