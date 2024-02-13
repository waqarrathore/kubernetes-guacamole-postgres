This series of YAML files sets up a vanilla Apache Guacamole remote access gateway on kubernetes v29.1
props to various people on the internet who have kindly shared their code which I have cobbled togather to get this working.


The postres bit was based on this excellent digital ocean tutorial:

https://www.digitalocean.com/community/tutorials/how-to-deploy-postgres-to-kubernetes-cluster

The Guacamole bit was inspired by the medium article:

https://oopflow.medium.com/how-to-install-guacamole-on-kubernetes-7d747438c141


The underlying database as you might guess from the name of the repo is Postgresql, and it's using peristent storage.
The Apache guacamole components (guacamole, guacd) are both vanilla from Apache 



Prerequisites:

A functional kubernetes 29.1 cluster.

Control plane node with git installed.



Installation:

clone the repo onto the home drive of the administrative user on the control plane node.

cd kubernetes-guacamole-postgres

./indb.sh (you will need to make this executable with a chmod +x indb.sh)

The script changes the namespace context in kubernetes, so you should be able to view the pods for the app, run a "kubectl get pods"
They'll be a minimum of 3, a guacamole one, a guacd one and a postgres one.

Once installed find the endpoint IP address by using the following command:

kubectl describe svc guacamole

grab that ip address and port, depending on the pod network choice, if its the default one that that most people go for (10.244.0.0/16)

it will probably look like: 

10.244.xxx.xxx:8080

paste it and modify it so it looks like that below, into a browser on a device that can route to that network,

http://10.244.xxx.xxx:8080/guacamole/#/

and you should be presented with the guacamole login screen.  
The default credentials? both username and password set to guacadmin, prudent to create a new admin account and disable that one.

Troubleshooting.
The script initially starts up the postres database pod, and injects the guacamole schema into it.
It waits 20 seconds for the pod to start up before running the schema update on the database
Change the slepp length in the indb.sh script if you find that the postgres service is slow to start
Will have to find a cleverer way of doing this bit. Timers eh?? Pffft

