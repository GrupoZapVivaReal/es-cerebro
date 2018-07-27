
CEREBRO_VERSION?=0.8.1

ORG?=vivareal
PROJECT?=es-cerebro

ENV:=prod

IMAGE_NAME:=lmenezes/cerebro:$(CEREBRO_VERSION)

K8S_NAMESPACE?=search

run:
	docker run -it --rm -p 9000:9000 $(IMAGE_NAME)

generate-deployment:
	PROJECT=$(PROJECT) K8S_NAMESPACE=$(K8S_NAMESPACE) ENV=$(ENV) VERSION=$(CEREBRO_VERSION) IMAGE_NAME=$(IMAGE_NAME) envsubst < deploy/k8s.yaml.tmpl > deploy/k8s.yaml

deploy: k8s_token k8s_cluster generate-deployment
	kubectl -n $(K8S_NAMESPACE) -s $(K8S_CLUSTER) --token=$(K8S_TOKEN) --insecure-skip-tls-verify apply --record -f deploy/k8s.yaml

k8s_token:
	$(if $(value K8S_TOKEN),,$(error "K8S_TOKEN is required for Makefile"))

k8s_cluster:
	$(if $(value K8S_CLUSTER),,$(error "K8S_CLUSTER is required for Makefile"))
