---
tags: 
cssclass: null
source: null
created: "2024-07-29 11:53"
updated: "2024-07-30 15:36"
date updated: 2024-07-30 15:35
---

Spring 5.0 新特性

- **响应式编程支持**：提供了对响应式编程的增强支持。
- **核心框架改进**：可能包括性能优化、功能增强等方面的改进。

# Spring 实战

- @Configuration 注释向 Spring 表明这是一个配置类，它将为 Spring 应用程序上下文提供 beans。 配置的类方法带有 @Bean 注释，指示它们返回的对象应作为 beans 添加到应用程序上下文中（默认情况下，它们各自的 bean IDs 将与定义它们的方法的名称相同）。
- 与基于 XML 的配置相比，基于 Java 的配置具有多个优点，包括更高的类型安全性和改进的可重构性。即使这样，仅当 Spring 无法自动配置组件时，才需要使用 Java 或 XML 进行显式配置。

自动配置

- 自动配置起源于 Spring 技术，即 自动装配 和 组件扫描。借助组件扫描，Spring 可以自动从应用程序的类路径中发现组件，并将其创建为 Spring 应用程序上下文中的 bean。通过自动装配，Spring 会自动将组件与它们依赖的其他 bean 一起注入。
- 最近，随着 Spring Boot 的推出，自动配置的优势已经远远超出了组件扫描和自动装配。Spring Boot 是 Spring 框架的扩展，它提供了多项生产力增强功能。这些增强功能中最著名的就是 自动配置，在这种配置中，Spring Boot 可以根据类路径中的条目、环境变量和其他因素，合理地猜测需要配置哪些组件，并将它们连接在一起。
- 这里想要展示一些演示自动配置的示例代码，但是并没有这样的代码，自动配置就如同风一样，可以看到它的效果，但是没有代码可以展示。我可以说 “看！这是自动配置的示例！” 事情发生、组件启用并且提供了功能，而无需编写代码。缺少代码是自动配置必不可少的要素，这使它如此出色。
- Spring Boot 自动配置大大减少了构建应用程序所需的显式配置（无论是 XML 还是 Java）的数量。实际上，当完成本章中的示例时，将拥有一个正在运行的 Spring 应用程序，该应用程序仅包含一行 Spring 配置代码！
- Spring Boot 极大地增强了 Spring 开发的能力，很难想象没有它如何开发 Spring 应用程序。因此，本书将 Spring 和 Spring Boot 视为一模一样。我们将尽可能使用 Spring Boot，并仅在必要时使用显式配置。而且，由于 Spring XML 配置是使用 Spring 的老派方式，因此我们将主要关注基于 Java 的 Spring 配置。



# Spring 5.0 新特性

- **响应式编程支持**：提供了对响应式编程的增强支持。包括 Spring WebFlux，这是一个全新的响应式 web 框架，它借鉴了 Spring MVC 的编程模型，允许开发人员创建可更好地扩展和使用更少线程的 web 应用程序。
- 最新版本的 Spring Data 支持创建响应式的、非阻塞的数据存储库。所有这些都构建在 Project Reactor 的基础上，这是一个用于处理响应式类型的 Java 库。
- Spring Boot 2 现在提供了比以前更多的自动配置支持，以及一个完全重新设计的 Actuator，用于查看和操作正在运行的应用程序。
- Spring Cloud 提供了一些工具，使配置和发现微服务变得容易，并且增强了它们的功能，使它们对失败更有弹性。
- **核心框架改进**：可能包括性能优化、功能增强等方面的改进。

响应式编程是一种编程范式，旨在更轻松地处理异步和事件驱动的程序逻辑。

在响应式编程中，数据和事件的流动被视为“数据流”或“事件流”，程序会对这些流中的变化做出自动响应。

其主要特点包括：

1. 异步性：能够高效地处理异步操作，避免阻塞和等待，提高程序的性能和响应能力。
    - 例如，在网络请求中，无需等待请求完成，可以在请求发送后继续执行其他任务，当响应返回时再进行处理。
2. 基于事件驱动：通过监听事件的发生来触发相应的处理逻辑。
    - 像用户的鼠标点击、键盘输入等都可以作为事件来触发特定的功能。
3. 声明式风格：开发者更关注于描述“做什么”，而不是“怎么做”。
    - 比如，只需声明当某个数据满足特定条件时要执行的操作，而无需详细描述实现的步骤。

响应式编程在 Web 开发、移动应用开发、实时数据处理等领域都有广泛的应用。它可以使代码更简洁、更易于理解和维护，同时能够更好地处理复杂的并发和异步场景。

例如，在一个实时聊天应用中，使用响应式编程可以轻松地处理新消息的接收和显示，而无需复杂的轮询或回调机制。

# Spring 基础

- 在第一章中，将快速概述 Spring 和 Spring Boot 的要点，并展示如何在 Taco Cloud 上初始化第一个 Spring 项目。
- 在第二章中，
    - 你将深入研究 Spring MVC，并了解如何在浏览器中呈现模型数据以及如何处理并验证表单输入。
    - 还将获得选择视图模板库的一些提示。
- 在第三章中，
    - 将在 Taco Cloud 应用程序中添加数据持久性。
    - 我们将介绍使用 Spring 的 JDBC 模板，如何插入数据以及如何使用 Spring Data 声明 JPA 存储库。
- 在第四章中，
    - 介绍了 Spring 应用程序的安全性。
    - 包括自动配置 Spring Security，定义自定义用户存储，自定义登录页面并防止跨站点请求伪造（CSRF）攻击。
- 在第一部分中，
    - 我们将在第五章中介绍配置属性，将学习如何微调自动配置的 bean 和应用配置属性到应用程序组件，并与 Spring 的 profile 文件一起使用。

## 第 1 章 Spring 入门

- Spring 和 Spring Boot 概述
- 初始化一个 Spring 项目
- 纵览 Spring

### 1.1 什么是 Spring？

- Spring 的核心是一个容器，通常称为 Spring 应用程序上下文，用于创建和管理应用程序组件。
    - 这些组件（或 bean）在 Spring 应用程序上下文中连接在一起以构成一个完整的应用程序，就像将砖、灰浆、木材、钉子、管道和电线绑在一起以组成房屋。
- 将 bean 连接在一起的行为是基于一种称为依赖注入（DI）的模式。
    - 依赖项注入的应用程序不是由组件自身创建和维护它们依赖的其他 bean 的生命周期，而是依赖于单独的实体（容器）来创建和维护所有组件，并将这些组件注入需要它们的 bean。
    - 通常通过构造函数参数或属性访问器方法完成此操作。
- 例如，假设在应用程序的许多组件中，要处理两个组件：
    - inventory service（用于获取库存级别）
    - product service（用于提供基本产品信息）。product service 取决于 inventory service，以便能够提供有关产品的完整信息。图 1.1 说明了这些 bean 与 Spring 应用程序上下文之间的关系。
- 除了其核心容器之外，Spring 和完整的相关库产品组合还提供 Web 框架、各种数据持久性选项、安全框架与其他系统的集成、运行时监视、微服务支持、响应式编程模型以及许多其他功能，应用于现代应用程序开发。
- 从历史上看，引导 Spring 应用程序上下文将 bean 连接在一起的方式是使用一个或多个 XML 文件，这些文件描述了组件及其与其他组件的关系。例如，以下 XML 声明两个 bean，一个 InventoryService bean 和一个 ProductService bean，然后通过构造函数参数将 InventoryService bean 注入到 ProductService 中：

图 1.1 通过 Spring 上下文管理应用组件和注入

```xml
<bean id="inventoryService" class="com.example.InventoryService" />
<bean id="productService" class="com.example.ProductService" >
    <constructor-arg ref="inventoryService" />
</bean>
```

但是，在最新版本的 Spring 中，基于 Java 的配置更为常见。以下基于 Java 的配置类等效于 XML 配置：

```java
@Configuration
public class ServiceConfiguration {
    @Bean
    public InventoryService inventoryService() {
        return new InventoryService();
    }
    
    @Bean
    public ProductService productService() {
        return new ProductService(inventoryService());
    }
}
```

### 1.2 初始化Spring应用程序

创建 Taco Cloud，这是一个在线应用程序，用于订购由真人制作的最美味的食物 - 玉米饼。 当然，将使用 Spring、Spring Boot 以及各种相关的库和框架来实现此目标。

依靠 Spring Initializr 来引导应用程序的创建。

Spring Initializr 既是一个基于浏览器的 Web 应用程序，又是一个 REST API，它们可以生成一个基本的 Spring 项目结构，可以使用所需的任何功能充实自己。 使用 Spring Initializr 的几种方法如下：

- 从 Web 应用程序 [http://start.spring.io](http://start.spring.io/) 创建
- 使用 curl 命令从命令行创建
- 使用 Spring Boot 命令行接口从命令行创建
- 使用 Spring Tool Suite 创建一个新项目的时候
- 使用 IntelliJ IDEA 创建一个新项目的时候
- 使用 NetBeans 创建一个新项目的时候

使用 Spring Tool Suite 中对 Spring Initializr 的支持来创建一个新项目。

顾名思义，Spring Tool Suite 是一个绝佳的 Spring 开发环境。但是它还提供了一个方便的 Spring Boot Dashboard 功能（至少在撰写本文时）其他任何 IDE 选项中均不提供。

如果你不是 Spring Tool Suite 用户，很好，我们是朋友了。跳至附录，用最适合你的 Initializr 选项代替以下各节中的说明。但是要知道，在本书中，我偶尔会引用特定于 Spring Tool Suite 的功能，例如 Spring Boot Dashboard。如果你不使用 Spring Tool Suite，则需要调整这些说明以适合你的 IDE。

### 使用 Spring Tool Suite 初始化 Spring 项目

转到 “文件” 菜单并选择 “新建”，然后选择 “Spring Starter Project”。图 1.2 显示了要查找的菜单结构。
![[Pasted image 20240730174541.png]]
图 1.2 使用 Spring Tool Suite 的 Initializr 创建新项目

一旦选择了 Spring Starter Project，就会出现创建新的项目向导对话框（图1.3）。向导的第一页要求提供一些常规项目信息，例如项目名称、描述和其他基本信息。如果您熟悉Maven pom.xml 文件的内容，则可以将大多数字段识别为以 Maven 构建规范结尾的项目。对于 Taco Cloud 应用程序，填写如图 1.3 所示的对话框，然后单击 “下一步”。
![[Pasted image 20240730174546.png]]
图 1.3 填写 Taco Cloud 应用程序项目信息

向导的下一页使您可以选择要添加到项目中的依赖项（请参见图 1.4）。注意，在对话框顶部附近，您可以选择要作为项目基础的 Spring Boot 版本。默认为最新可用版本。通常，最好保持原样，除非您需要定位其他版本。

至于依赖项本身，您可以展开各个部分并手动查找所需的依赖项，或者在 “可用” 列表顶部的搜索框中搜索它们。对于 Taco Cloud 应用程序，选择图 1.4 中所示的依赖项。

![[Pasted image 20240730174550.png]]
图 1.4 选择依赖

此时，可以单击完成以生成项目并将其添加到工作区。但是，如果感到有点危险，请再次单击 “下一步”，以查看新的 starter 项目向导的最后一页，如图 1.5 所示。

![[Pasted image 20240730174554.png]]
图 1.5 指定备用 Initializr 地址（可选）

默认情况下，新项目向导在 [http://start.spring.io](http://start.spring.io/) 上调用 Spring Initializr 以生成项目。通常，不需要覆盖此默认值，这就是为什么可以在向导第二页上单击 “完成” 的原因。但是，如果由于某种原因要托管自己的 Initializr 克隆版本（也许是自己计算机上的本地副本，或者是在公司防火墙内运行的自定义克隆版本），那么将需要更改 Base Url 字段以指向 Initializr 实例，然后单击完成。

单击完成后，将从 Initializr 下载该项目并将其加载到工作区中。稍等片刻，使其加载和构建，然后就可以开始开发应用程序功能了。但是首先，让我们看一下 Initializr 所带来的好处。

### 新建 Spring + mybatis + MySQL 项目

vscode

Create a maven Project
输入 spring 选择 Create a maven Project

### 检查 Spring 项目结构

典型的 Maven 或 Gradle 项目结构，其中应用程序源代码位于src/main/java 下，测试代码位于 src/test/java 下，非 Java 资源位于 src/main/resources 下 。在该项目结构中，需要注意以下事项：
- `mvnw` 和 `mvnw.cmd` —— 这些是 Maven 包装器脚本。即使你的计算机上没有安装 Maven，也可以使用这些脚本构建项目。
- `pom.xml` —— 这是 Maven 构建规范，一会儿我们将对此进行更深入的研究。
- `TacoCloudApplication.java` —— 这是引导项目的 Spring Boot 主类。稍后，我们将在这节详细介绍。
- `application.properties` —— 该文件最初为空，但提供了一个可以指定配置属性的地方。我们将在本章中对此文件进行一些修改，但在第 5 章中将详细介绍配置属性。
- `static` —— 在此文件夹中，可以放置要提供给浏览器的任何静态内容（图像、样式表、JavaScript 等），最初为空。
- `templates` —— 在此文件夹中，放置用于向浏览器呈现内容的模板文件。最初为空，但很快会添加 Thymeleaf 模板。
- `TacoCloudApplicationTests.java` —— 这是一个简单的测试类，可确保成功加载 Spring 应用程序上下文。开发应用程序时，将添加更多的测试。
    

随着 Taco Cloud 应用程序的增长，将使用 Java 代码、图像、样式表、测试以及其他可帮助完成项目的附带材料来填充此准系统的项目结构。但是与此同时，让我们更深入地研究 Spring Initializr 提供的一些选项。

**探索构建规范**

填写 Initializr 表单时，指定应使用 Maven 构建项目。因此，Spring Initializr 给了你一个 pom.xml 文件，该文件已经填充了你所做的选择。程序清单 1.1 显示了 Initializr 提供的整个 pom.xml 文件。

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
        http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    
    <groupId>sia</groupId>
    <artifactId>taco-cloud</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <packaging>jar</packaging>
    
    <name>taco-cloud</name>
    <description>Taco Cloud Example</description>
    
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.0.4.RELEASE</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
    
    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
        <java.version>1.8</java.version>
    </properties>
    
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-thymeleaf</artifactId>
        </dependency>
        
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-devtools</artifactId>
            <scope>runtime</scope>
        </dependency>
        
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
        
        <dependency>
            <groupId>org.seleniumhq.selenium</groupId>
            <artifactId>selenium-java</artifactId>
            <scope>test</scope>
        </dependency>
        
        <dependency>
            <groupId>org.seleniumhq.selenium</groupId>
            <artifactId>htmlunit-driver</artifactId>
            <scope>test</scope>
        </dependency>
    
    </dependencies>
    
    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
</project>
```

xml 文件中第一个值得注意的项是 `<packaging>` 元素。你选择将应用程序构建为可执行的 JAR 文件，而不是 WAR 文件。这可能是你所做的最奇怪的选择之一，特别是对于 web 应用程序。毕竟，传统的 Java web 应用程序被打包为 WAR 文件，而 JAR 文件是库和偶尔使用的桌面 UI 应用程序的首选打包方式。

选择 JAR 打包是一种不切实际的选择。虽然 WAR 文件非常适合部署到传统的 Java 应用服务器，但是它们并不适合大多数云平台。尽管一些云平台（如 Cloud Foundry）能够部署和运行 WAR 文件，但是所有的 Java 云平台都能够运行可执行的 JAR 文件。因此，Spring Initializr 默认为 JAR 打包，除非你不让它这样做。

如果打算将应用程序部署到传统的 Java 应用服务器，那么需要选择 WAR 打包并包含 web 初始化类。我们将在第 2 章中更详细地讨论如何构建 WAR 文件。

接下来，请注意 `<parent>` 元素，更具体地说，注意它的 `<version>` 子元素。这指定您的项目将 `spring-boot-starter-parent` 作为它的父 POM。除此之外，这个父 POM 还为 Spring 项目中常用的几个库提供依赖项管理。对于父 POM 覆盖的那些库，不必指定版本，因为它是从父 POM 继承的。`2.0.4.RELEASE` 版本，表示你正在使用 Spring Boot 2.0.4，这样项目将使用继承自 Spring Boot 版本中定义的依赖项管理。

在讨论依赖项时，请注意在 `<dependencies>` 元素下声明了三个依赖项。前两个看起来应该比较熟悉。它们直接对应于在单击 Spring Tool Suite 新建项目向导中的 Finish 按钮之前选择的 Web 和 Thymeleaf 依赖项。第三个依赖项提供了许多有用的测试功能，你不必选中包含它的方框，因为 Spring Initializr 假定（希望是正确的）你将编写测试。

你可能还会注意到，所有这三个依赖项的 artifact ID 中都有 _starter_ 这个词。Spring Boot starter 依赖项的特殊之处在于，它们本身通常没有任何库代码，而是间接地引入其他库。这些 starter 依赖提供了三个主要的好处：

- 构建的文件将会小得多，也更容易管理，因为不需要对每一个可能需要的库都声明一个依赖项。
- 可以根据它们提供的功能来考虑需要的依赖关系，而不是根据库名来考虑。如果正在开发一个 web 应用程序，那么将添加 web starter 依赖项，而不是一个编写 web 应用程序的各个库的清单。
- 不用担心 library 版本问题。可以相信的是，对于给定版本的 Spring Boot，可间接地引入的库的版本将是兼容的，只需要考虑使用的是哪个版本的 Spring Boot。
    

最后，构建规范以 Spring Boot 插件结束。这个插件执行一些重要的功能：

- 提供了一个 Maven 编译目标，让你能够使用 Maven 运行应用程序。这将在第 1.3.4 节中尝试实现这个目标。
- 确保所有的依赖库都包含在可执行的 JAR 文件中，并且在运行时类路径中可用。
- 在 JAR 文件中生成一个 manifest 文件，表示引导类（在本书例子中是 `TacoCloudApplication`）是可执行 JAR 的主类。
    

说到引导类，让我们打开它，仔细看看。

**引导应用程序**

因为将从一个可执行的 JAR 运行应用程序，所以在运行 JAR 文件时，有一个主类来执行是很重要的。还需要至少一个最小的 Spring 配置文件来引导应用程序。这就是将在 `TacoCloudApplication` 类中找到的内容，如下程序清单 1.2 所示。

程序清单 1.2 Taco Cloud 引导类

复制

```
package tacos;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class TacoCloudApplication {
    public static void main(String[] args) {
        SpringApplication.run(TacoCloudApplication.class, args);
    }
}
```

虽然 `TacoCloudApplication` 中只有很少的代码，但是其中包含了相当丰富的内容。最强大的代码行之一也是最短的代码行之一。`@SpringBootApplication` 注释清楚地表明这是一个 Spring 引导应用程序。但是 `@SpringBootApplication` 中有更多的东西。`@SpringBootApplication` 是一个组合了其他三个注释的复合应用程序：

- `@SpringBootConfiguration` —— 指定这个类为配置类。尽管这个类中还没有太多配置，但是如果需要，可以将 Javabased Spring Framework 配置添加到这个类中。实际上，这个注释是`@Configuration` 注释的一种特殊形式。
    
- `@EnableAutoConfiguration` —— 启用 Spring 自动配置。稍后我们将详细讨论自动配置。现在，要知道这个注释告诉 Spring Boot 自动配置它认为需要的任何组件。
    
- `@ComponentScan` —— 启用组件扫描。这允许你声明其他带有 `@Component`、`@Controller`、`@Service` 等注释的类，以便让 Spring 自动发现它们并将它们注册为 Spring 应用程序上下文中的组件。
    

`TacoCloudApplication` 的另一个重要部分是 `main()` 方法。这个方法将在执行 JAR 文件时运行。在大多数情况下，这种方法是样板代码；编写的每个 Spring 引导应用程序都有一个类似或相同的方法（尽管类名不同）。

`main()` 方法调用 SpringApplication 类上的静态 `run()` 方法，该方法执行应用程序的实际引导，创建`Spring` 应用程序上下文。传递给 `run()` 方法的两个参数是一个配置类和命令行参数。虽然传递给 `run()` 的配置类不必与引导类相同，但这是最方便、最典型的选择。

你可能不需要更改引导类中的任何内容。对于简单的应用程序，你可能会发现在引导类中配置一两个其他组件很方便，但是对于大多数应用程序，最好为任何没有自动配置的东西创建一个单独的配置类。你将在本书的整个过程中定义几个配置类，因此请注意这些细节。

**测试应用程序**

测试是软件开发的一个重要部分。认识到这一点后，Spring Initializr 提供了一个测试类。程序清单 1.3 显示了基准测试类。

程序清单 1.3 基准应用测试

复制

```
package tacos;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
​
@RunWith(SpringRunner.class)
@SpringBootTest
public class TacoCloudApplicationTests {
    @Test
    public void contextLoads() {
    }
}
```

在 `TacoCloudApplicationTests` 中没有太多东西：类中的一个测试方法是空的。尽管如此，这个测试类确实执行了必要的检查，以确保 Spring 应用程序上下文能够成功加载。如果做了任何阻止创建 Spring 应用程序上下文的更改，则此测试将失败，这样你就可以通过解决问题来应对。

还要注意用 `@RunWith(SpringRunner.class)` 注释的类。`@RunWith` 是一个 JUnit 注释，提供了一个测试运行器来引导 JUnit 运行测试用例。请将清单 1.3 看作是对它的基准应用程序测试，即将插件应用到 JUnit 以提供自定义测试行为。在本例中，JUnit 被赋予了 SpringRunner，这是一个由 Spring 提供的测试运行程序，它提供了创建一个 Spring 应用程序上下文的功能，以供测试运行。

**其他名字的测试运行器**

如果你已经熟悉编写 Spring 测试，或者正在查看一些现有的基于 Spring 的测试类，那么你可能已经看到了一个名为 `SpringJUnit4ClassRunner` 的测试运行器。`SpringRunner` 是 `SpringJUnit4ClassRunner` 的别名，它是在 Spring 4.3 中引入的，用于删除与特定版本的 JUnit （例如，JUnit4）的关联。毫无疑问，别名更易于阅读和输入。

`@SpringBootTest` 告诉 JUnit 使用 Spring 引导功能引导测试。现在，把它看作是在 `main()` 方法中调用 `SpringApplication.run()` 的测试类就足够了。在本书的过程中，将多次看到 `@SpringBootTest`，我们将揭示它的一些功能。

最后，还有测试方法本身。尽管 `@RunWith(SpringRunner.class)` 和 `@SpringBootTest` 的任务是加载用于测试的 Spring 应用程序上下文，但是如果没有任何测试方法，它们将没有任何事情要做。即使没有任何断言或任何类型的代码，这个空的测试方法也会调用两个注释完成它们的工作，并加载 Spring 应用程序上下文。如果运行过程中有任何问题，测试就会失败。

至此，我们已经完成了对 Spring Initializr 提供的代码的回顾。看到了一些用于开发 Spring 应用程序的样板基础，但是仍然没有编写任何代码。现在，启动 IDE，掸掉键盘上的灰尘，并向 Taco Cloud 应用程序添加一些定制代码。