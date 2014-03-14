淘宝-量子前端开发框架
=====================================================
在您毫无感知的情况下，完成代码检测、合并、压缩、优化、部署以及更多可能做到的事情

1. 请根据您的需要设置src目录下的相关目录树
2. 请根据您设置后的目录树修改Gruntfile.js内的任务目录
3. 可以运行相关任务了，前提是您安装了grunt以及相关任务模块（如何安装请往下阅读）

### 学习这个框架的一些资料和方法：

1. 请注意，npmjs.org是你最长去的地方，这里有关于这个框架使用到的所有任务包的文档
1. 要学会基本的node系统的调试方法：
`debugger断点`、`console打印`、`nodejs调试的浏览器插件`，去搜索吧

### 准备步骤

1. 安装node
   [如何安装](http://nodejs.org/)
1. 安装npm
    [如何安装](http://npmjs.org/)
1. 安装grunt-cli
    npm install grunt-cli -g

### 操作步骤

1. npm install lz-fe
1. 进入目录，安装全部的依赖包
   ```bash
      npm install
   ```
    [发生问题如何处理？](http://edui.alibaba-inc.com)
    > 或者安装你指定需要的task包：
      ```bash
         npm install taskPackageName --save-dev
      ```
    > load-grunt-tasks这个npm包是用来管理所有在package.json文件内需要调用的包的管理器，有了她可以很简单的使用
    ```bash
        module.exports = function (grunt) {
            // load all grunt tasks
            require('load-grunt-tasks')(grunt);
        }
    ```
    这样来完成所有需要如下格式调用的任务包：
    ```bash
        grunt.loadNpmTasks('grunt-contrib-qunit');
    ```
    
1. 配置你需要的Gruntfile.js
    > 实际上：我已经提供了默认的Gruntfile.js，只需要配置其中几个小的地方，比如：
        `livereload端口号`、`webserver端口号`、`rap路径和实际部署的路径[用来做开发和生产环境切换的]`
    > 小技巧：可以从安装的node_modules下面抄一个来哦~

### 如何配置镜像：

    如何配置国内npm镜像：
    
        ```bash
         sh bin/cnpm.sh
        ```
    如何配置国外npm镜像：
    
      ```bash
         sh bin/npm.sh
      ```
### 如何查找你需要的任务包

1. 访问：npmjs.org并搜索相关名称
1. 命令行：
```bash
npm search xxxxx
```
### 操作步骤（使用者版本）
1. npm install lz-fe
1. 安装全部的依赖包 npm install
1. grunt server
1. grunt public

* * *
使用grunt的团队，一般是先由一个工程师构想一种架构，然后写好一份Gruntfile，大家用的时候，那个架构设计的工程师会告诉大家一种开发规范，而且要求大家不要动Gruntfile里的内容。如果架构上有什么调整，就要所有项目的Gruntfile都要修改才行。

如果提供一种包装机制，让gruntfile和grunt打包成一个新工具，命令行执行新工具的命令的时候，它就把命令行参数配合gruntfile直接扔给内部的grunt就好了，让真正开发的工程师接触不到那一坨gruntfile文件。

### 配置过程中的一些坑爹：
1. copy时通过使用`process的过滤函数`可以过滤掉一些复制文本的内容，但是这货貌似也会过滤图象之类的文本内容，导致图象文件破损，加载失败
    > `解决方案：`过滤时判断文件类型，需要的再去过滤，此处需要参考grunt API或者在第二个参数路径名中进行判断
    
   ```bash
    process: function (content, srcPath) {
        if (/\.html$/.test(srcPath)) {
            //do some filter things
        }
    }
   ```


*****************************************
## change logs
1. 2014-03-13
    完成基本搭建
