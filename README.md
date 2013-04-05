# Purpose

This is the vagrant-machine I used for my talk at Berlin Expert Days 2013.
[There is no My Machine](http://bed-con.org/2013/talks/there-is-no-my-machine/)
 
It is a simpler version of a developer box that we use at work. Such a developer box
provides all tools a developer needs except the IDE and Version Control. It will usually
be checked in with the main source code.

## Basic usage

```
cd vagrant-demo
vagrant up
```

# Features

## Vagrant Features in use

The following Vagrant features are used:

* Puppet provisioning
* Port Forwarding
* Private Network 
* Synced Folders 

The Vagrant machine uses 10.11.12.13 as IP adress.

## Mongo DB with automatic backup

Mongo datafiles can unfortunatly not be placed in a shared folder.
Thats why this vagrant machine uses mongodump to create a backup of the db all 5 minutes.

Use:

```
mongorestore /var/data/mongo
```

to recreate your database after vagrant destroy.

## Tomcat for remote debugging

There is a tomcat package installed with some features, that make it useable for remote
working and debugging using an IDE. 

### Synced folders

The webapps and the log folder are synced folder and
can be used from host. They are synced into

```
vagrant-demo/data/tomcat/webapps
vagrant-demo/data/tomcat/logs
```

### JMX

The tomcat is configured so that it can be connected via JMX using port 9004.
Try it with jconsole after starting the vagrant machine:

```
jconsole 10.11.12.13:9004
```

### Debugging

Remote debugging is activated on port 1317.

# License

This repository is release under the [MIT License](http://opensource.org/licenses/MIT)
