# Docker CMAK

Docker image of [yahoo/CMAK](https://github.com/yahoo/CMAK).

## Testing and Development

Some tests are provided in [tests/](tests/).

A `docker-compose.yaml` is provided with Zookeeper and Kafka. Once running a cluster can be added by setting the "Cluster Zookeeper Hosts" to `zk:2181`.
