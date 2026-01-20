# Docker CMAK (Cluster Manager for Apache Kafka)

[![build and push on main and tags](https://github.com/panubo/docker-cmak/actions/workflows/build-push.yml/badge.svg)](https://github.com/panubo/docker-cmak/actions/workflows/build-push.yml)

Docker image of [yahoo/CMAK](https://github.com/yahoo/CMAK).

This repository builds and publishes a Docker image for CMAK (Cluster Manager for Apache Kafka, previously known as Kafka Manager).

<!-- BEGIN_TOP_PANUBO -->
> [!IMPORTANT]
> **Maintained by Panubo** — Cloud Native & SRE Consultants in Sydney.
> [Work with us →](https://panubo.com.au)
<!-- END_TOP_PANUBO -->

## Version

*   CMAK: `3.0.0.6`

## Usage

### Running with Docker

To run the image:
```bash
docker run -p 9000:9000 -e ZK_HOSTS=your_zookeeper_hosts panubo/cmak
```
The CMAK web interface will be available at http://localhost:9000.

### Development Environment

A `docker-compose.yaml` is provided for a quick development and test setup. It includes Zookeeper, Kafka, and the CMAK image.

To start the services:
```bash
docker-compose up
```
Once running, you can add a new cluster in the CMAK UI.
*   **Cluster Zookeeper Hosts:** `zk:2181`

## Building the Image

To build the Docker image locally, you can use the provided Makefile:
```bash
make build
```

## Configuration

The CMAK instance can be configured using environment variables. The primary variable is `ZK_HOSTS` to point to your Zookeeper ensemble.

| Environment Variable | Description                      | Default   |
| -------------------- | -------------------------------- | --------- |
| `ZK_HOSTS`           | Zookeeper hosts for CMAK to use. | `zk:2181` (in docker-compose) |

## Testing

The project includes a test suite using `bats`. The tests are located in the `tests/` directory.

To run the tests:
```bash
make test
```

## CI/CD

This repository uses GitHub Actions to automatically build and publish multi-arch (`linux/amd64`, `linux/arm64`) Docker images to:

*   `quay.io/panubo/cmak`
*   `public.ecr.aws/panubo/cmak`

Images are tagged based on git branches and tags.

## Status

Stable and production ready.

<!-- BEGIN_BOTTOM_PANUBO -->
> [!IMPORTANT]
> ## About Panubo
>
> This project is maintained by Panubo, a technology consultancy based in Sydney, Australia. We build reliable, scalable systems and help teams master the cloud-native ecosystem.
>
> We are available for hire to help with:
>
> * SRE & Operations: Improving system reliability and incident response.
> * Platform Engineering: Building internal developer platforms that scale.
> * Kubernetes: Cluster design, security auditing, and migrations.
> * DevOps: Streamlining CI/CD pipelines and developer experience.
> * [See our other services](https://panubo.com.au/services)
>
> Need a hand with your infrastructure? [Let’s have a chat](https://panubo.com.au/contact) or email us at team@panubo.com.
<!-- END_BOTTOM_PANUBO -->
