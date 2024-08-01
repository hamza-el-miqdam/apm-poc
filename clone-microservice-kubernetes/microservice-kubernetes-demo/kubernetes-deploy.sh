#!/bin/sh
if [ -z "$DOCKER_ACCOUNT" ]; then
    DOCKER_ACCOUNT=elmiqdam
fi;
kubectl create deployment apache --image=docker.io/$DOCKER_ACCOUNT/microservice-kubernetes-demo-apache:latest --port=80 -n apm
kubectl expose deployment apache --type="LoadBalancer" --port 80 -n apm
kubectl create deployment catalog --image=docker.io/$DOCKER_ACCOUNT/microservice-kubernetes-demo-catalog:latest --port=8080 -n apm
kubectl expose deployment catalog --type="LoadBalancer" --port 8080 -n apm
kubectl create deployment customer --image=docker.io/$DOCKER_ACCOUNT/microservice-kubernetes-demo-customer:latest --port=8080 -n apm
kubectl expose deployment customer --type="LoadBalancer" --port 8080 -n apm
kubectl create deployment order --image=docker.io/$DOCKER_ACCOUNT/microservice-kubernetes-demo-order:latest --port=8080 -n apm
kubectl expose deployment order --type="LoadBalancer" --port 8080 -n apm
