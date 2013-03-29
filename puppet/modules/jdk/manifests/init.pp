class jdk {

notify {"jdk module":  
        message => "Running module jdk.",
}

package {"java-1.7.0-openjdk":
         ensure => installed,
	 require => Notify["jdk module"],
}

package {"java-1.7.0-openjdk-devel":
         ensure => installed,
	 require => Package["java-1.7.0-openjdk"],
}

}
