# Purpose

 
# Features

## Mongo DB with automatic backup

Mongo datafiles can unfortunatly not be placed in a shared folder.
Thats why this vagrant machine uses mongodump to create a backup of the db all 5 minutes.

Use:

mongorestore /var/data/mongo

to recreate your database after vagrant destroy.
