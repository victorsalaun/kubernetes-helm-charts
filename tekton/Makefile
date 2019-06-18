.PHONY: setup \
		build \
		install upgrade delete

setup:
	helm repo add jenkins-x https://storage.googleapis.com/chartmuseum.jenkins-x.io

build:
	helm dependency build
	helm lint .
	helm template .

install:
	 helm install --tiller-namespace tekton-pipelines --namespace tekton-pipelines -f values.yaml --name tekton jenkins-x/tekton

upgrade:
	helm upgrade --install --force --tiller-namespace tekton-pipelines --namespace tekton-pipelines -f values.yaml tekton .

delete:
	helm delete --purge --tiller-namespace tekton-pipelines tekton
