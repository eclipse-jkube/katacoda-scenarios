We can now proceed to compile our application and deploy it into the cluster:
```
mvn package k8s:build k8s:resource k8s:apply
```{{execute}}

- `k8s:build` goal will take care of building a Docker image for our application. The image is Java 11 compatible
  and contains the generated packaged war application alongside a preconfigured Apache Tomcat.
- `k8s:resource` goal will create our resource manifests in `target/classes/META-INF/jkube/kubernetes.yml`{{open}}.
  The manifests include a Deployment with a container that references the image built in the previous goal and an HTTP port `8080`.
  It also includes a Service that exposes the mentioned port.
- `k8s:apply` goal will apply the generated resource manifests to the configured cluster (similar to `kubectl apply -f`)

Once the deployment is available and the Pod ready we can test it by invoking:
```
curl $(kubectl get svc spring -o jsonpath="{.spec.clusterIP}"):8080
```{{execute}}

We can also run regular `kubectl` commands to check the Kuberentes resources for our application:

- `kubectl get pods`{{execute}} 
- `kubectl get svc`{{execute}} 
- `kubectl get deployment.apps`{{execute}} 

As a bonus track, you can test the log development goal to check the application logs in the cluster:

```
mvn k8s:log
```{{execute}}