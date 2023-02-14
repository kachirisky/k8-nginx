Basic K8 NGINX Deployment

1. Edit the file k8-nginx-Deployment.yaml and add your own values for:
	* namespace
	* name
	* container to your own dockerhub repository



Simple nginx deployment to the internet



Testing a default deployment:

1. Log into your kubernetes cluster and deploy NGINX
   * Lets create a basic deployment with the image you uploaded to docker hub, this command will output the YAML to your screen:
   kubectl create deployment -n kachirisky --image=ikachiriskys/k8-nginx --dry-run=client -oyaml

   * You can apply the deployment right away or save your YAML and use kubectl apply -f k8-nginx
   kubectl create deployment -n kachirisky --image=ikachiriskys/k8-nginx


2. Expose your deployment to the internet by creating a Service with --type=LoadBalancer
   * Create a Service or Save it to a YAML
   kubectl expose deployment k8-nginx --type=LoadBalancer -n kachirisky --name=my-service --port=8080 --target-port=80 --dry-run=client -oyaml
   * Check the Service in your namespace and check for a public IP Address
   kubectl get service -n kachirisky


What happen here? Lets take a look at the Deployment and the Service

Review both with the following commands:
   * kubectl get deployment -n kachirisky k8-nginx -oyaml
   * kubectl get service -n kachirisky my-service -oyaml

Check how the service is behaving:
   * kubectl describe service -n kachirisky my-service
   * kubectl describe deployments.apps -n kachirisky k8-nginx


Lets check some metrics from the POD:

   * kubectl top pod -n kachirisky

test=1
while [ $test -le 10 ]
do
curl http://34.122.144.164:8080
test=$(( $test + 1 ))
done


Increase your number of replicas to see K8 loadbalancing in action:

   * You can use the --dry-run=client and -oyaml flags to see what changes will be made to your deployment

   * kubectl scale --replicas=4 deployment/k8-nginx -n kachirisky
   or
   * kubectl scale --replicas=4 deployment/k8-nginx -n kachirisky --dry-run=client -oyaml


* Finally create a new container to make changes and see how the rolling update works:

* Lets talk about secrets

DOCKER_REGISTRY_SERVER=docker.io
DOCKER_USER=fake_user
DOCKER_EMAIL=fake_email
DOCKER_PASSWORD=fake_password

kubectl create secret docker-registry myregistrykey \
  --docker-server=$DOCKER_REGISTRY_SERVER \
  --docker-username=$DOCKER_USER \
  --docker-password=$DOCKER_PASSWORD \
  --docker-email=$DOCKER_EMAIL --dry-run=client -oyaml > k8-nginx-hub-secret.yaml



