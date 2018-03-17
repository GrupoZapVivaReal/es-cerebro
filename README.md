# Elasticsearch Cerebro

Tool (https://github.com/lmenezes/cerebro) to monitor and manage Elasticsearch.

# Setup

## How to run

```
make run
```

## How to deploy

This will deploy to the production k8s:

```
make deploy
```

To deploy to QA environment, simply do:

```
make ENV=qa deploy
```

Its possible to override the namespace and the k8s cluster like this:

```
make K8S_NAMESPACE=mynamespace K8S_CLUSTER=my-k8s.myorg.com deploy
```
