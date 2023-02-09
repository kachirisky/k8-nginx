# k8-nginx

Simple nginx deployment to the internet



Testing a default deployment:

1. Log into your kubernetes cluster and deploy NGINX
   kubectl create deployment -n namespace-a --image=nginx nginx

2. Expose your deployment to the internet
   kubectl expose deployment nginx --type=LoadBalancer -n namespace-a --name=my-service --port=8080


3. Check the status of your current services
   kubectl get service -n namespace-a



Homework:

1. Create a dockerhub account

2. Clone this repository

3. Docker build your own image and push to your Dockerhub account

4. Execute the previous commands to obtain a custom reply from your NGINX Server