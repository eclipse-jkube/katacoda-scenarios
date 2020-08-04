### Create Java classes for the project
The next step is to create the required Java classes.

```
mkdir -p src/main/java/com/example/webapp/spring
touch src/main/java/com/example/webapp/spring/ExampleInitializer.java    \
      src/main/java/com/example/webapp/spring/ExampleConfiguration.java  \
      src/main/java/com/example/webapp/spring/ExampleResource.java
```{{execute}}

#### ExampleInitializer
This class is the code version of the standard `WEB-INF/web.xml`. We will used to configure Spring's servlet context.

We open `src/main/java/com/example/webapp/spring/ExampleInitializer.java`{{open}} in the editor and add the following:

<pre class="file" data-filename="src/main/java/com/example/webapp/spring/ExampleInitializer.java" data-target="replace">
package com.marcnuri.demo.jkube;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;

public class ExampleInitializer implements WebApplicationInitializer {
  @Override
  public void onStartup(ServletContext servletContext) {
    final AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
    context.register(ExampleConfiguration.class);
    context.setServletContext(servletContext);
    final ServletRegistration.Dynamic dsr = servletContext.addServlet("dispatcher", new DispatcherServlet(context));
    dsr.setLoadOnStartup(1);
    dsr.addMapping("/");
  }
}
</pre>

#### ExampleConfiguration
This class is a Spring-specific configuration to enable Spring Web MVC.

We open `src/main/java/com/example/webapp/spring/ExampleConfiguration.java`{{open}} in the editor and add the following:

<pre class="file" data-filename="src/main/java/com/example/webapp/spring/ExampleConfiguration.java" data-target="replace">
package com.marcnuri.demo.jkube;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
@ComponentScan
public class ExampleConfiguration implements WebMvcConfigurer {
}
</pre>

#### ExampleResource
This is a simple RestController with a single endpoint.

We open `src/main/java/com/example/webapp/spring/ExampleResource.java`{{open}} in the editor and add the following:

<pre class="file" data-filename="src/main/java/com/example/webapp/spring/ExampleResource.java" data-target="replace">
package com.marcnuri.demo.jkube;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ExampleResource {

  @GetMapping
  public String hello() {
    return "Hello Katacoda!!!";
  }
}
</pre>