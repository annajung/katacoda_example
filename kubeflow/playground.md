Please run the following to ensure that cluster is running.

`launch.sh`{{execute}}

After Kubernetes has started, run the following command to validate env has been set up successfully.

`kubectl version`{{execute}}

Wait for all pods to have `Running` status.

`kubectl get pod`{{execute}}
