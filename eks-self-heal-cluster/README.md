# Self-Healing Kubernetes Cluster with Karpenter & HPA

## Overview
This project demonstrates how to implement a self-healing Kubernetes cluster using Karpenter for node autoscaling and the Horizontal Pod Autoscaler (HPA) for workload-based scaling. It is designed to optimize resource usage, ensuring efficient cost management while maintaining high availability.

By deploying this setup on an AWS EKS cluster, the system automatically provisions new nodes when demand increases and removes idle nodes when they are no longer needed.

## Features
Automated Node Scaling – Karpenter provisions or deprovisions nodes based on workload requirements.
Pod Autoscaling – HPA dynamically adjusts the number of pods based on CPU utilization.
Metrics-Driven Scaling – The Kubernetes Metrics Server collects resource usage data to drive scaling decisions.
Self-Healing – If nodes or pods fail, Kubernetes automatically replaces them.

## Architecture
This setup consists of:

- An EKS cluster running workloads
- Karpenter for autoscaling nodes
- HPA for autoscaling pods
- Metrics Server to monitor CPU and memory usage

![EKS-Self-Heal](https://github.com/user-attachments/assets/67f95c0c-f676-4d9f-a8ea-166e96d9b2a8)


## Prerequisites
Before deploying this project, ensure you have:

- An AWS EKS cluster set up
- kubectl configured to connect to the cluster
- IAM permissions for Karpenter to manage EC2 instances
- Helm installed for managing Kubernetes packages

## Deployment Steps

1. Install the Metrics Server
The Metrics Server is required for HPA to function. Deploy it with:

```
kubectl apply -f metrics-server.yaml
```
2. Deploy Karpenter
Karpenter provisions worker nodes dynamically. Apply the Karpenter configuration:

```
kubectl apply -f karpenter.yaml
```

3. Deploy the Sample Application
A simple Nginx application is used to demonstrate autoscaling. Deploy it with:
```
kubectl apply -f nginx-app.yaml
```

4. Set Up Horizontal Pod Autoscaler
Apply the HPA configuration to enable pod autoscaling:
```
kubectl apply -f hpa.yaml
```

## Testing the Autoscaling

Check HPA Status
Verify if HPA is working:
```
kubectl get hpa
```
## Simulate Load to Trigger Scaling
To test autoscaling, generate high CPU load:
```
kubectl run --rm -i -t load-test --image=busybox -- /bin/sh -c "while true; do wget -q -O- http://nginx-service; done"
```

## Monitor how HPA increases the number of pods:
```
kubectl get pods -o wide
```
## Cleanup
To remove all deployed resources, run:

```
kubectl delete -f hpa.yaml
kubectl delete -f nginx-app.yaml
kubectl delete -f karpenter.yaml
kubectl delete -f metrics-server.yaml
```

## Conclusion
This project provides a scalable and resilient Kubernetes setup using Karpenter and HPA. It ensures that workloads are always running optimally while reducing unnecessary infrastructure costs.
