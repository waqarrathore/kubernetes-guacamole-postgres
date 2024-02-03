This series of YAML files sets up a vanilla Apache Guacamole remote access gateway on kubernetes v29.1
The underlying database as you might guess from the name of the repo is Postgresql
The Apache guacamole components (guacamole, guacd) are both vanilla from Apache 

Prerequisites:
A functional kubernetes 29.1 cluster.
Control plane node with git installed.

Installation:
clone the repo onto the home drive of the administrative user
cd kubernetes-guacamole-postgres
./indb.sh
