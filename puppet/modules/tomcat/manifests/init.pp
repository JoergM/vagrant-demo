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

file { "/var/data/tomcat/":
       ensure => directory,
}

file { "/var/data/tomcat/webapps":
       ensure => directory,
       require => File["/var/data/tomcat"],
}

file { "/var/data/tomcat/logs":
       ensure => directory,
       require => File["/var/data/tomcat"],
}

file {"/usr/share/tomcat7/webapps":
      ensure => link,
      target => "/var/data/tomcat/webapps",
      require => File["/var/data/tomcat/webapps"],
}

file {"/usr/share/tomcat7/logs":
      ensure => link,
      target => "/var/data/tomcat/logs",
      require => File["/var/data/tomcat/logs"],
}

service { "tomcat7":
	  ensure => 'running',
	  require => [File['/etc/sysconfig/tomcat7'],File["/usr/share/tomcat7/logs"],File["/usr/share/tomcat7/webapps"]],
}

}
