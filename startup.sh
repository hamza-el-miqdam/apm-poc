#!/bin/sh

kubectl apply -f namespace-apm.yaml
helm install elasticsearch --values elastic-values.yaml elastic/elasticsearch -n apm
sleep 50
helm install kibana --values kibana-values.yaml elastic/kibana -n apm

kubectl apply -f fleet-server-rbac.yaml -n apm
kubectl apply -f fleet-server.yaml -n apm

# ./microservice-kubernetes/microservice-kubernetes-demo/kubernetes-deploy.sh
