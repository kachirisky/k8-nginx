README.md

* Using helm

To install Helm, run this command:

curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash


Install a default NGINX deployment with Helm:

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-nginx bitnami/nginx