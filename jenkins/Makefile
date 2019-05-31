.PHONY: build \
		install upgrade delete \
		upgrade-install-plugins

build:
	helm dependency build
	helm lint .
	helm template .

install:
	 helm install --tiller-namespace ci --namespace ci -f values.yaml --name jenkins stable/jenkins

upgrade:
	helm upgrade --tiller-namespace ci --namespace ci -f values.yaml jenkins .

delete:
	helm delete --purge --tiller-namespace ci jenkins

upgrade-install-plugins:
	./upgrade-install-plugins.sh
