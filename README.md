# Try out filesystem based xDS with Envoy on Kubernetes
The xDS vision is one of a universal data plane API, articulated at
[https://blog.envoyproxy.io/the-universal-data-plane-api-d15cec7a](https://blog.envoyproxy.io/the-universal-data-plane-api-d15cec7a).
xDS aims to provide a set of APIs that provide the de facto standard for L4/L7
data plane configuration, similar to the role played by OpenFlow at L2/L3/L4 in
SDN.

You can start Envoy with dynamic configuration by using files that implement the xDS protocol. When the files are changed on the filesystem, Envoy will automatically update its configuration.

This repository provides some basic bootstrap configurations like CDS and RDS to play around with Envoy and xDS on Kubernetes to quickly try out Envoy and xDS behaviour.

## Steps
1. Create K8s resources
```sh
make apply
```

2. Simulate traffic using hey
```sh
make load
```