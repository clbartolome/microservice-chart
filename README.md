# microservice-chart

Helm Chart to deploy demo applications in Openshift

## Configuration

<table>
<tr><th>Property</th><th>Description</th><th>Example</th></tr>
<tr><td>global.nameOverride</td><td>Override application Name</td><td>newName</td></tr>
<tr><td>runtime</td><td>Runtime OCP topology label</td><td>quarkus</td></tr>
<tr><td>image.name</td><td>Application image</td><td>openshift/appName</td></tr>
<tr><td>image.tag</td><td>Application image tag</td><td>1.0.0</td></tr>
<tr><td>deploy.replicas</td><td>Number of pod replicas</td><td>1</td></tr>
<tr><td>deploy.resources</td><td>Application limit and requests</td><td>

```yaml
limits:
  cpu: 100m
  memory: 256Mi
requests:
  cpu: 50m
  memory: 128Mi
```
</td></tr>
<tr><td>deploy.ports</td><td>Application exposed ports</td><td>

```yaml
- name: http
  port: 8080
  targetPort: 8080
  protocol: TCP
```
</td></tr>
<tr><td>deploy.livenessProbe</td><td>Application liveness prove</td><td>

```yaml
failureThreshold: 3
httpGet:
  path: /q/health/live
  port: 8080
  scheme: HTTP
periodSeconds: 10
successThreshold: 1
timeoutSeconds: 1
```
</td></tr>
<tr><td>deploy.readiness</td><td>Application readiness prove</td><td>

```yaml
failureThreshold: 3
httpGet:
  path: /q/health/ready
  port: 8080
  scheme: HTTP
periodSeconds: 10
successThreshold: 1
timeoutSeconds: 1
```
</td></tr>
<tr><td>deploy.env</td><td>Application environment variables</td><td>

```yaml
- name: VAR_NAME
  value: var-value
```
</td></tr>
<tr><td>deploy.route.enabled</td><td>Expose application using a route</td><td>true</td></tr>
<tr><td>deploy.route.targetPort</td><td>Route target port</td><td>http</td></tr>
<tr><td>deploy.route.tls.enabled</td><td>TLS route</td><td>false</td></tr>
</table>





oc adm policy add-cluster-role-to-user self-provisioner -z pipeline -n cicd