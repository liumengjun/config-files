### gradle中，模块A依赖core模块的测试代码

测试代码(test文件夹下的代码)，是不跟随打包发布的，而且默认不随project依赖传递到其他的模块，需要用`.sourceSets.test.output`指明


#### 简单配置，如下：

```gradle
// A's build.gradle
dependencies {
    compile project(':core')
    //...
    testCompile project(':core').sourceSets.test.output
}
```


#### 或者，configuration of testOutput
以上只是简单的配置，也可以配置一个testOutput configuration，具体如下：

```gradle
// core's build.gradle
configurations {
    testOutput
}
dependencies {
    testOutput sourceSets.test.output
}
```

然后

```gradle
// A's build.gradle
dependencies {
    //...
    testCompile project(path: ':core', configuration: 'testOutput')
}
```


#### 参考链接
- [Gradle: sub-project test dependencies in multi-project builds](https://softnoise.wordpress.com/2014/09/07/gradle-sub-project-test-dependencies-in-multi-project-builds/)
