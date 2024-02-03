#!/bin/bash
kubectl config set-context --current --namespace=guacamole
kubectl apply -f 00-gauca-namespace.yaml
kubectl apply -f 08-guaca-secret.yaml
kubectl apply -f 01-guac-pgsql-pv.yaml
kubectl apply -f 02-guaca-pclam.yaml
kubectl apply -f 02-pgsql-svc.yaml
kubectl apply -f 06-pgsql-dep.yaml
sleep 20
#kubectl config set-context --current --namespace=guacamole
POD=$(kubectl get pod -l app=postgres -o jsonpath="{.items[0].metadata.name}")
kubectl exec -i $POD -- psql -U guacamole -d guacamole_db < initdb.sql
kubectl apply -f $HOME/kubernetes-guacamole-postgres
