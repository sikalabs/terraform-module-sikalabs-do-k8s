save-config:
	terraform output -raw kubeconfig > kubeconfig.yml

add-config: save-config
	cp ~/.kube/config ~/.kube/config.$$(date +%Y-%m-%d_%H-%M-%S).backup
	KUBECONFIG=kubeconfig.yml:~/.kube/config kubectl config view --raw > /tmp/kubeconfig.merge.yml && cp /tmp/kubeconfig.merge.yml ~/.kube/config

get-versions:
	doctl kubernetes options versions

get-sizes:
	doctl kubernetes options sizes

install-ingress: save-config
	KUBECONFIG=kubeconfig.yml kubectl apply -f https://raw.githubusercontent.com/ondrejsika/kubernetes-ingress-traefik/master/ingress-traefik.yml
