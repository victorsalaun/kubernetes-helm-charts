.PHONY: build \
		install upgrade delete

build:
	helm dependency build
	helm lint .
	helm template .

install:
	 helm install --tiller-namespace ci --namespace ci -f values.yaml --name sonar stable/sonarqube

upgrade:
	helm upgrade --tiller-namespace ci --namespace ci -f values.yaml sonar .

delete:
	helm delete --purge --tiller-namespace ci sonar
