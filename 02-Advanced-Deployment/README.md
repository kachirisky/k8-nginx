Kubernetes Basic Objects

Kind:					apiVersion:
Pod     				v1
Deployment				apps/v1

POD: https://kubernetes.io/docs/concepts/workloads/pods/

Deployments: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/


1. Lets create a Basic POD and deploy this with multiple containers

2. Create a Deployment with a side car


Notice the difference in how a POD YAML and a Deployment YAML are different

* What about replicasets and what are they for?


* As as group fix the following deployment 03-Deployment-to-POD.yaml



* Optional Bunus: Deploy Fibunacci and break the cluster but first needs troubleshooting to start

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-with-sidecar
  namespace: kachirisky
spec:
  replicas: 3
  selector:
    matchLabels:
      app: k8-nginx
  template:
    metadata:
      labels:
        app: k8-nginx
    spec:
      containers:
      - name: k8-nginx
        image: ikachiriskys/fibonacci
        ports:
        - containerPort: 80
      - name: sidecar
        image: alpine:latest
        command: ["/bin/sh", "-c"]
        args:
          - |
            apk update; apk add curl
            for ((i=l;i<=1500;i++));
            do echo -n $i-; curl http://34.135.255.147:8080/fibonacci -H "Content-Type: application/json" -d '{"number": 6}'; done




Curl command to integrate:
for ((i=l;i<=1500;i++)); do echo -n $i-; curl http://34.135.255.147:8080/fibonacci -H "Content-Type: application/json" -d '{"number": 6}'; done