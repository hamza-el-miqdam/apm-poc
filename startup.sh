#!/bin/sh

helm repo add elastic https://helm.elastic.co
helm repo update

kubectl apply -f namespace-apm.yaml
helm install elasticsearch --values ./elk/elastic-values.yaml elastic/elasticsearch -n apm
sleep 50
helm install kibana --values ./elk/kibana-values.yaml elastic/kibana -n apm
sleep 30

kubectl apply -f fleet-server -n apm

# ./clone-microservice-kubernetes/microservice-kubernetes-demo/kubernetes-deploy.sh
