We can now proceed to compile our application and deploy it into the cluster:
```
./mvnw install k8s:build k8s:resource k8s:apply
```{{execute}}

- `k8s:build` goal will take care of building a Docker image for our application
- `k8s:resource` goal will create our resource manifests in `target/classes/META-INF/jkube/kubernetes.yml`{{open}}
- `k8s:apply` goal will apply the generated resource manifests to the configured cluster (similar to `kubectl apply -f`)

Our endpoint should be ready by now, we can test it by invoking:
```
curl $(kubectl get svc demo -o jsonpath="{.spec.clusterIP}"):8080
```{{execute}}

We can also run regular `kubectl` commands to check the Kuberentes resources for our application:

- `kubectl get pods`{{execute}} 
- `kubectl get svc`{{execute}} 
- `kubectl get deployment.apps`{{execute}} 

As a bonus track, you can test the log development goal to check the application logs in the cluster:

```
./mvnw k8s:log
```{{execute}}