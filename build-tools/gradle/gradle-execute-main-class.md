### 关于gradle执行main-class
> 用application插件，使用JavaExec任务


#### 传递jvm option用`jvmArgs`属性，示例如下：

```gradle
task execute(type:JavaExec) {
    //only for projects do not have "main" classes but use default starters
    if(project.hasProperty('mainClassName')) {
        main = mainClassName
        classpath = sourceSets.main.runtimeClasspath
        jvmArgs = ["-agentlib:jdwp=transport=dt_socket,address=31843,suspend=n,server=y", "-Dgreeting=hello"]
    }
}
```


#### 调试gradle启动的程序：
`GRADLE_OPTS`环境变量只是把给定的参数传递给`gradle`，没有传递给要执行的`main-class`。比如要调试程序，用`GRADLE_OPTS`是没用的，我们不调试`gradle`，我们需要调试的是`main-class`，故需要用`jvmArgs`。


#### 两个参考链接
- (1) [The Application Plugin - Gradle User Manual](https://docs.gradle.org/current/userguide/application_plugin.html)

- (2) [Gradle to execute Java class (without modifying build.gradle) - Stack Overflow](https://stackoverflow.com/questions/21358466/gradle-to-execute-java-class-without-modifying-build-gradle)
