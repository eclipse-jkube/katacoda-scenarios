The first step is to create a Spring Boot Maven project using https://start.spring.io.

### Download Example Project
We start by downloading an initial project by using start.spring.io as a web service:
```
curl -s https://start.spring.io/starter.tgz  \
    -d bootVersion=2.3.1.RELEASE \
    -d dependencies=web -d javaVersion=1.8 \
    | tar -xzf-

```{{execute}}

The previous command will download and extract an example project with the `web` dependency and with compatibility
for Java 8.

### Create Example REST endpoint
We can now create a simple REST endpoint in the application by creating a `DemoResource` class:
```
touch src/main/java/com/example/demo/DemoResource.java
```{{execute}}

The previous command will create an empty file for our REST endpoint class ready for us to edit.

We open the file `src/main/java/com/example/demo/DemoResource.java`{{open}} in the editor
and add the following content to the empty file to create a valid `DemoResource` class:
<pre class="file" data-filename="src/main/java/com/example/demo/DemoResource.java" data-target="replace">
package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoResource {

  @GetMapping
  public String hello() {
    return  "hello\n";
  }
}
</pre>

The class is annotated with `@RestController` which will be auto-detected by Spring.

The class contains a single method `hello()` annotated with `@GetMapping`.
The detected configuration inferred from these annotations translates into having an endpoint in the root path which will 
respond `hello` to any HTTP request.
