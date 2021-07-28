The first step is to create a new Maven project from scratch.

### Create `pom.xml`
We start by creating an empty `pom.xml`
```
touch pom.xml
```{{execute}}

and we open it (`pom.xml`{{open}}) in the editor.

### Add project XML configuration
Next, we will define our project configuration:

<pre class="file" data-filename="pom.xml" data-target="replace">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;
&lt;project xmlns=&quot;http://maven.apache.org/POM/4.0.0&quot;
  xmlns:xsi=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;
  xsi:schemaLocation=&quot;http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd&quot;&gt;
  &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;

  &lt;groupId&gt;com.example.webapp&lt;/groupId&gt;
  &lt;artifactId&gt;spring&lt;/artifactId&gt;
  &lt;version&gt;0.0.0-SNAPSHOT&lt;/version&gt;
  &lt;packaging&gt;war&lt;/packaging&gt;

  &lt;properties&gt;
    &lt;maven.compiler.source&gt;1.8&lt;/maven.compiler.source&gt;
    &lt;maven.compiler.target&gt;1.8&lt;/maven.compiler.target&gt;
    &lt;failOnMissingWebXml&gt;false&lt;/failOnMissingWebXml&gt;
  &lt;/properties&gt;

  &lt;dependencies&gt;
    &lt;dependency&gt;
      &lt;groupId&gt;org.springframework&lt;/groupId&gt;
      &lt;artifactId&gt;spring-webmvc&lt;/artifactId&gt;
      &lt;version&gt;5.2.6.RELEASE&lt;/version&gt;
    &lt;/dependency&gt;
    &lt;dependency&gt;
      &lt;groupId&gt;javax.servlet&lt;/groupId&gt;
      &lt;artifactId&gt;javax.servlet-api&lt;/artifactId&gt;
      &lt;version&gt;4.0.1&lt;/version&gt;
      &lt;scope&gt;provided&lt;/scope&gt;
    &lt;/dependency&gt;
  &lt;/dependencies&gt;
  &lt;build&gt;
    &lt;plugins&gt;
      &lt;plugin&gt;
        &lt;groupId&gt;org.eclipse.jkube&lt;/groupId&gt;
        &lt;artifactId&gt;kubernetes-maven-plugin&lt;/artifactId&gt;
        &lt;version&gt;1.4.0&lt;/version&gt;
      &lt;/plugin&gt;
    &lt;/plugins&gt;
  &lt;/build&gt;

&lt;/project&gt;
</pre>

This is a very simple Maven project.

The first part defines the project's group, artifact and version (GAV) Maven coordinates. This is an example, so
values here are not important, but take into account that these will be used by JKube to define the image and Kubernetes
resources names.

Then we define the packaging for the project (`war`). Maven will create a war package as the project's output artifact,
which is the usual format for Java web applications.

The next section contains the dependencies for the project, in this case a dependency for Spring WebMVC and a
dependency for the Java Servlet API that will be provided at runtime by the web application (Java servlet) container (Tomcat).

Finally, in the build section we add the dependency for Eclipse JKube. As you can see, the configuration is very
straightforward.
