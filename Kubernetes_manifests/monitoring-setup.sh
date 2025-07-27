#!/bin/bash

# Step 1: Add Helm repos (if not already added)
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Step 2: Install kube-prometheus-stack with LoadBalancer for Prometheus and Grafana
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace \
  --set prometheus.service.type=LoadBalancer \
  --set grafana.service.type=LoadBalancer \
  --set grafana.adminPassword='admin123'

echo "Installation started. Use the commands below to get LoadBalancer IPs:"

echo ""
echo "Grafana:"
echo "kubectl get svc -n monitoring kube-prometheus-stack-grafana"
echo ""
echo "Prometheus:"
echo "kubectl get svc -n monitoring kube-prometheus-stack-prometheus"