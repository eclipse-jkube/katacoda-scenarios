The next step is to add Eclipse JKube Kubernetes Maven plugin dependency into the plugin section.

We open the project's `pom.xml`{{open}} file in the editor, and we'll add the following entry into the `<plugins>` section:

<pre class="file" data-filename="pom.xml" data-target="insert" data-marker="&lt;plugins&gt;">
&lt;plugins&gt;
      &lt;plugin&gt;
        &lt;groupId&gt;org.eclipse.jkube&lt;/groupId&gt;
        &lt;artifactId&gt;kubernetes-maven-plugin&lt;/artifactId&gt;
        &lt;version&gt;1.4.0&lt;/version&gt;
      &lt;/plugin&gt;
</pre>

This is all the required configuration to make our application cloud native.
