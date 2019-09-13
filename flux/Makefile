.PHONY: build \
		install upgrade delete

build:
	helm repo add fluxcd https://charts.fluxcd.io
	kubectl apply -f https://raw.githubusercontent.com/fluxcd/flux/helm-0.14.1/deploy-helm/flux-helm-release-crd.yaml

install:
	 helm install --tiller-namespace flux --namespace flux -f values.yaml --name flux fluxcd/flux

upgrade:
	helm upgrade --install --tiller-namespace flux --namespace flux -f values.yaml flux .

delete:
	helm delete --purge flux
