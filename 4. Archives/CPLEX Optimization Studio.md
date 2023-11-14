# Orientation Guide
## Brief overview of CPLEX Optimization Studio

CPLEX® Optimization Studio consists of a modeling language, two optimization engines to solve the models, and an integrated development environment to test and debug the models.

CPLEX Optimization Studio is composed of:

- OPL, the Optimization Programming Language, used to write mathematical models.
- An integrated development environment (IDE) that enables you to develop and test the models.
- The CPLEX Optimizer engine, to find solutions to models that require mathematical programming techniques.
- The CP Optimizer engine, to find solutions to models that require constraint programming techniques.

## Analyzing a simple OPL model

Analyzes a simple OPL model and describes how to execute the model in the IDE.


### The business problem

A manufacturer has some products he wants to sell, and these products are manufactured with resources. The products can be made in either of two ways. They can be made inside the factory, where production consumes scarce resources and there is a cost per unit to manufacture the products, or they can be ordered from outside the factory. In the latter case there is no resource usage but there is a higher cost per unit to purchase the products. There is a constraint that all customer demand for the products must be satisfied, and the business goal is to minimize cost.

The problem is to determine how much of each product should be produced inside the company and how much outside, while minimizing the overall production cost, meeting the demand, and satisfying the resource constraints.

### The mathematical representation

Conventions used in this mathematical description

- Uppercase is used for data and constants
- Lowercase is used for variables

Data

- $P$ is the number of products; p is an index ranging from 1 to P.
- $R$ is the number of resources; r is an index ranging from 1 to R.
- _$C_{p,r}$_ is the amount of resource r consumed by product p when produced inside.
- _$D_p$_ is the amount of demand for product p.
- _$INSIDECOST_p$_ is the cost of producing one unit of product p.
- _$OUTSIDECOST_p$_ is the cost of providing one unit of product p from an outside source.
- _$CAPA_r$_ is the maximal capacity of resource r.

Decision variables

- _$in_p$_ is the amount of product p manufactured inside the plant (positive or null).
- _$out_p$_ is the amount of product p provided by outside sources (positive or null).

The mathematical problem
$$
\begin{array}{ll}
minimize& (\sum^{p=P}_{p=1}  INSIDECOST_p in_p+OUTSIDECOST_p out_p) \\
subject\ to \\
\forall r\ in\ 1..R, & (\sum^{p=P}_{p=1}C_{p,r}\cdot in_p)\le CAPA_r \\
\forall p\ in\ 1..P, & in_p + out_p \ge D_p \\
\forall p\ in\ 1..P, & in_p\ge 0, out_p \ge 0
\end{array}
$$

The objective, line (1), is to minimize the total cost, computed as the sum over all products of both the internal cost incurred by actually producing the product and the cost of purchasing the product from an outside source.

The capacity constraint, line (2), states that the total required capacity cannot exceed the maximum for any resource.

The demand constraint, line (3), states that, for all products, the sum of products produced inside, plus those provided from outside sources, must be greater than the demand.

Line (4) states that we are only interested in solutions for which production amounts are positive.

### The OPL code

OPL allows you to write a mathematical representation of your business problem that is separate from your data. An example of an OPL model, production.mod, is shown here. The terms in **bold** are OPL keywords.

```
{string} Products = ...;
{string} Resources = ...;

float Consumption[Products][Resources] = ...;
float Capacity[Resources] = ...;
float Demand[Products] = ...;
float InsideCost[Products] = ...;
float OutsideCost[Products]  = ...;

dvar float+ Inside[Products];
dvar float+ Outside[Products];

minimize
  sum( p in Products ) 
    ( InsideCost[p] * Inside[p] + OutsideCost[p] * Outside[p] );
   
subject to {
  forall( r in Resources )
    ctCapacity: 
      sum( p in Products ) 
        Consumption[p][r] * Inside[p] <= Capacity[r];

  forall(p in Products)
    ctDemand:
      Inside[p] + Outside[p] >= Demand[p];
}
```

1. The first step in specifying an OPL model is to declare the data, and in this particular instance the first things you declare are the index sets, which represent the set of products and the set of resources.
    
    ```
    {string} Products = ...;
    {string} Resources = ...;
    ```
    
    These are defined as sets of strings. That is, the strings are the names of the products and the resources. On the right-hand side of the equal sign, the three dots are the OPL notation to indicate that you read this data from an external data source, which could be a data file, a spreadsheet, or a database. You do not have to specify the data within the model; the data is read in from a data file.
    
2. Next, you specify the recipe. How many units of each resource are required for each product?
    
    ```
    float Consumption[Products][Resources] = ...;
    ```
    
    This is an array, called “Consumption” with two indexes. One index is the set of products and the other is the set of resources. The notation “float” indicates a real number. So each entry in this array represents the amount of resource that is required to produce one unit of each product.
    
3. There is a capacity available for each resource, or an amount of each resource available.
    
    ```
    float Capacity[Resources] = ...;
    ```
    
    This is, again, a real number array, “Capacity”, that is indexed over the resources.
    
4. A quantity of each product is required. This is an array indexed by the products, called "Demand," and is also a real number.
    
    ```
    float Demand[Products] = ...;
    ```
    
5. And then there are the costs per unit for production, inside the factory and outside, of each product.
    
    ```
    float InsideCost[Products] = ...;
    float OutsideCost[Products]  = ...;
    ```
    

The product in this model could be anything. For example, it could be jewelry. So we could have a data file that goes with this particular model when we are producing jewelry that looks like this:

```
Products =  { "rings", "earrings" };  //index sets for
Resources = { "gold", "diamonds" };   //products and resources

Consumption = [ [3.0, 1.0], [2.0, 2.0] ];
Capacity = [ 130, 180 ];
Demand = [ 100, 150 ];
InsideCost = [ 250, 200 ];
OutsideCost  = [ 260, 270 ];
```

In that case, there are two products, rings and earrings, and two resources, gold and diamonds. The recipe calls for three units of gold and one diamond to produce each ring, or two units of gold and two diamonds for each earring. For the amount of resources available, there are 130 units of gold and 180 diamonds. The demand is for 100 rings and 150 pairs of earrings. The inside cost to produce the rings is $250 and to produce the earrings it is $200. The outside cost is $260 for rings and $270 for earrings.

However, in our distributed example, the products are pasta, and the production.dat file looks like this:

```
Products =  {"kluski", "capellini", "fettuccine"};
Resources = {"flour", "eggs"};

Consumption = [ [0.5, 0.2], [0.4, 0.4], [0.3, 0.6] ];
Capacity = [ 20, 40 ];
Demand = [ 100, 200, 300 ];
InsideCost = [ 0.6, 0.8, 0.3 ];
OutsideCost  = [ 0.8, 0.9, 0.4 ];
```

In this case there are three products - kluski, capellini and fettuccine - and there are two resources, flour and eggs. The consumption here is that producing a unit of kluski requires half a unit of flour and 0.2 units of eggs, and so forth for each of the other products. There is a capacity of 20 units of flour and 40 units of eggs. There is a demand of 100, 200, 300 for each of the three products -- kluski, capellini and fettuccine. And there is an inside and an outside cost to produce each product.

An important point to note here is that the model is the same for pasta, for jewelry, or any other product. The model does not depend on the data.

To return to the model, production.mod, we see that two decision variables are specified.

```
dvar float+ Inside[Products];
dvar float+ Outside[Products];
```

The two decision variables (`dvar`) are the inside production of each product and the outside production of each product, and they are specified as nonnegative real numbers, so we have a simple linear program here.

The actual specification of the model consists of the objective function and the constraints. The objective function in our example is to minimize the total cost of meeting the demand.

```
minimize
  sum( p in Products ) 
    ( InsideCost[p] * Inside[p] + OutsideCost[p] * Outside[p] );
```

This is the sum over each product in the product set of the inside cost of producing that product, times the inside production, plus the outside cost of producing that product, or acquiring that product, times the outside production.

The objective function is subject to two constraints.

```
subject to {
  forall( r in Resources )
    ctCapacity: 
      sum( p in Products ) 
        Consumption[p][r] * Inside[p] <= Capacity[r];

  forall(p in Products)
    ctDemand:
      Inside[p] + Outside[p] >= Demand[p];
```

The first constraint (`ctCapacity`) is a capacity constraint on the resources. It says that, for each resource in the set of resources, the sum over all the products of the consumption of the resource for that product, times the inside production, has to be less than or equal to the capacity available for that resource.

The second constraint (`ctDemand`) is the demand constraint. It says that, for each product in the set of products, the inside production plus the outside production has to be at least as great as the demand. So, again, this is a simple linear programming problem.

## First steps with the IDE

Briefly describes how to begin working with an OPL model in the IDE, after the IDE has been installed and launched.

1. To work with a model in the IDE, you must first create a project. The model and associated data are added to the project.
2. You create a model with the OPL modeling language in the editing area of the IDE. You then save the OPL code in a file with the extension `.mod`.
3. Usually, you create a data file in the IDE, and save the data in a file with the extension `.dat`. You can also have a simple model with the data inside the model.
4. Before executing a model, you need to create a run configuration, and add a model and data file to the run configuration. You then use the run command on a run configuration. If you want to test a model with different data files, you need to create a run configuration for each combination of model + data.
5. You can also add an optional settings file to a project, or to a run configuration. If you change the default values of settings, the new, user-defined, values are stored in the settings file with the extension `.ops`.

### Summary

A project file and a run configuration are mandatory. A model is contained in a run configuration. It is the run configuration that is executed. A project can contain several run configurations. Data files and settings files are optional.

Note that many examples of projects with models and data files can be found in your installation directory, for example:

```
C:\Program Files\IBM\ILOG\CPLEX_Studio<version>\opl\examples\opl
```

In this document, we will use a distributed example of an OPL project called 'production'. Here you can see the project structure in the IDE.

![[ide_project_elements[1] 1.jpg]]

The 'production' project contains two model files and three data files. These files are used in three different run configurations: **Basic Configuration**, **Named data**, and **Tuples**. The comment next to the project name indicates that the problem to be solved uses Mixed-Integer Linear Programming. The models will call the CPLEX® solving engine.

## Running a model in the IDE

Hands-on practice with a distributed example.

1. Start the IDE, if you have not already done so. For example, on Windows platforms:
    
    `Start> All Programs > IBM ILOG > CPLEX Optimization Studio<version> >CPLEX Studio IDE`
    
2. Open the example wizard: File > Import > Example.![Menu command File > Import > Example in the IDE.]
    ![[import_examples[1].jpg]]
3. In the New Example wizard, select IBM ILOG OPL Examples, and click Next. 
    ![[select_wizard[1].jpg]]
    The example wizard organizes the list of examples according to complexity (Advanced, Basic, Intermediary) or math programming technique.
    
4. Expand the Basic level, scroll down and select 'production', then click Finish.
    ![[exs_sorted_by_complexity[1] 1.jpg]]
    The collapsed 'production' project appears in the OPL Projects pane on the left.
    
5. Expand the 'production' project and the Run Configurations. In the Basic Configuration, double click the model and data files to display them in the editor.
    ![[production_model_in_editor[1].jpg]]
6. Right-click on Basic Configuration and select Run this.
    ![[run_this[1].jpg]]
7. After a few seconds, the optimal solution is displayed in the Solutions tab at the bottom of the IDE.
	![[Solutions_tab[1].jpg]]

## Discovering CPLEX Optimization Studio

Provides an overview of CPLEX® Optimization Studio, introduces OPL and scripting, and the IDE. Also introduces the optimization engines CPLEX Optimizer and CP Optimizer.

The main reason for using CPLEX Optimization Studio is to simplify and speed up the development and deployment of optimization-based applications. There are two kinds of people involved in the development of these applications: optimization experts, who are trained in operations research and know about mathematical modeling, and software developers, who are responsible for the data interfaces and the user interfaces that are needed to develop an optimization-based decision support application.

OPL, the modeling language, allows you to write a mathematical representation of your problem that is separate from your data. In OPL, a project is defined as one or more model files and one or more data files. Within a project, a run configuration represents a problem instance with a model and a data file, and you can have multiple run configurations within an OPL project.

There are two optimization engines. The mathematical programming optimization engine is called the CPLEX Optimizer and implements the Simplex method, the Barrier method and Mixed Integer programming. The constraint programming engine is called CPLEX CP Optimizer. This is another technology for optimization that is built on artificial intelligence principles. Constraint programming and mathematical programming are often complementary, since the strengths of one complement the weaknesses of the other.

The following documents will enable you to discover CPLEX Optimization Studio.

- **Introduction** to IBM ILOG CPLEX Optimization Studio
    
    Provides an overview of CPLEX Optimization Studio.
    
- **Introduction to OPL**
    
    Gives a short tour of the OPL modeling language, discusses some modeling issues, and illustrates optimization modeling with two examples.
    
- **Introduction to Scripting**
    
    The OPL language covers the requirements for expressing constraints on decision variables. However, an optimization application might also need functionality for manipulating data. This "non-modeling" expressiveness of OPL is called scripting, and is available as IBM ILOG Script. It is used to combine OPL models and interact with them. IBM ILOG Script is an implementation of JavaScript.
    
- **Getting Started with the IDE**
    
    Contains an introduction to the IDE, and a tutorial that explains how to create an empty project, enter an OPL model, add data and a settings file, create run configurations and execute the final project.
    
- **Parameters and Settings in OPL**
    
    Presents the parameters and options that you can set in the OPL settings (.ops) file, via the settings editor in the IDE. The command to create a settings file is File > New > Settings. You can control the type of optimization you want by modifying the values of the parameters, which are the settings for the optimization engines.
    
- **Getting Started with CPLEX**
    
    Introduces the components of CPLEX, describes how to set up CPLEX for your particular platform or IDE, and offers tutorials for the components of CPLEX, including the Interactive Optimizer and the application programming interfaces.
    
- **Getting Started with CP Optimizer**
    
    Provides an overview of CP Optimizer. Contains tutorials that guide you in learning about the concepts and features of CP Optimizer. As you follow the steps in the tutorial, you complete the OPL code and learn about the concepts. Then you compile and run the code and analyze the results. At the end of each tutorial, there are review exercises.
    

## Where to find the examples

On Windows platforms, the default installation directories are:

```
C:\Program Files\IBM\ILOG\CPLEX_Studio<version>\opl\examples\opl

C:\Program Files\IBM\ILOG\CPLEX_Studio<version>\cplex\examples

C:\Program Files\IBM\ILOG\CPLEX_Studio<version>\cpoptimizer\examples
```


## Becoming familiar with CPLEX Optimization Studio

Tutorials and user's guides illustrate the different features of CPLEX® Optimization Studio.

### Experimenting with OPL models in the IDE

To allow you to become more familiar with OPL models and the IDE, the following tutorials are available.

**Understanding solving statistics and progress (MP models)**

Uses a model solved by CPLEX Optimizer. Shows how the IDE displays a dynamically updated progress chart for a mixed integer programming (MIP) example that takes some time to solve.

**Understanding solving statistics and progress (CP models)**

Uses a model solved by CP Optimizer. Shows how the IDE displays a dynamically updated progress chart for a constraint programming example that takes a few seconds to solve.

**Working with external data**

OPL allows you to read data from a data source, such as a database or a spreadsheet. In this case, the data is said to be “external” to OPL, as opposed to the data in an internal OPL `.dat` file. This tutorial uses a model solved by CPLEX Optimizer, but all the features described work in the same way with a model solved by CP Optimizer.

**Using IBM ILOG Script for OPL**

Scripting is used to combine OPL models and interact with them. There are no separate script files; you write script statements directly in model files. With scripting, you can:

- Add preprocessing instructions to prepare data for a model.
- Control the flow while the model is solved.
- Set parameters and options.
- Add postprocessing instructions to aggregate, transform, and format data (including results data) for display or for sending to another application, for example, a spreadsheet.
- Solve repeated instances of the same model.
- Create solutions where the output of one model instance is used as the input of a second model instance.

**Relaxing infeasible models**

Uses a MIP example (`nurses.mod`) to demonstrate how the IDE detects conflicts and searches for relaxations in OPL models that appear infeasible after execution.

**Profiling the execution of a model**

When you execute a run configuration, information about execution time, memory consumption, and model extraction is collected as part of the execution. When execution stops, the information appears as a table in the Profiler output window. This topic explains how the IDE Profiler table can help you improve your model to make it run faster while consuming less memory.

**Working with the solution pool**

OPL supports the CPLEX solution pool for mixed integer programming (MIP) models. The solution pool is a way of generating and keeping more than one solution to a MIP problem. This allows you to evaluate and explore alternative solutions. This topic explains how to access a project solution pool in the IDE and how to set options and define filters on solution pool generation.

**Using the performance tuning tool**

The performance tuning tool finds the best combination of parameters, for the CPLEX part of a model, that can be set in the OPL settings. The tuning can be done for one or several run configurations so that the search performs best when your application is deployed. This topic describes how to improve the combination of parameters for the CPLEX part of an OPL model.

**Getting Started with Scheduling in CPLEX Studio**

Provides a series of tutorials on how to use the scheduling features of CP Optimizer in the IDE.

### Learning more about the OPL modeling language

**OPL, the modeling language**

Describes:

- the overall structure of OPL models
- the basic modeling concepts
- how data can be initialized internally, as it is declared, or externally in a `.dat` file
- how to connect to, read from, and write to databases and spreadsheets
- expressions and relations
- constraints
- formal parameters

**IBM ILOG Script for OPL**

- Describes the structure of the script language for OPL: the language constructs, the elements from which expressions can be constructed, and the possible types of statement.
- Presents the built-in values and functions: numbers, strings, Booleans, arrays, objects, dates, the `null` and `undefined` values, and the use of functions.

**Language Quick Reference**

Contains succinct descriptions of individual keywords and functions, as well as the operators and grammar for OPL, and the scripting language for OPL.

### Working with CPLEX Optimizer

For mathematical programming, you can solve linear and quadratic programs with the CPLEX Simplex or Barrier Optimizers. You can solve mixed integer linear and quadratic programs with the CPLEX Mixed Integer Optimizer. And you can solve quadratically constrained problems with CPLEX Barrier and Mixed Integer Optimizers.

**User's Manual for CPLEX**

IBM® ILOG® CPLEX offers C, C++, Java™, .NET, and Python libraries that solve linear programming (LP) and related problems. Specifically, it solves linearly or quadratically constrained optimization problems where the objective to be optimized can be expressed as a linear function or a convex quadratic function. The variables in the model may be declared as continuous or further constrained to take only integer values. This manual describes how to use these component libraries.

**File formats supported by CPLEX**

Documents the many file formats supported by CPLEX. After a brief description of the file formats in alphabetical order, the manual continues with longer explanations of the formats.

**Parameters of CPLEX**

Contains the parameters that control the behavior of CPLEX. Explains how users can access them and manage them.

**Examples of CPLEX**

Presents the examples delivered with CPLEX for the Callable Library, C++, Java, .NET, and Python APIs.

### Working with CP Optimizer

For constraint programming, you can solve detailed scheduling problems or hard combinatorial optimization problems with the CP Optimizer.

**CP Optimizer's User's Manual**

Offers explanations of how to use CP Optimizer effectively. All of the CP Optimizer functions and classes used in this manual are documented in the CP Optimizer Reference Manuals. As you study this manual, you will probably consult the appropriate reference manual (APIs for C++, Java, and .NET) from time to time, as it contains precise details on classes and their members. CP Optimizer requires a working knowledge of the Microsoft .NET Framework, or C++, or Java™. However, it does not require you to learn a new language since it does not impose any syntactic extensions on your programming language of choice.

## Advanced features

Contains reference information on OPL and the advanced features of the optimization engines. Also contains documents on the APIs that constitute the interface between the model development tools and the optimization engines. Includes information for integrating with other tools, such as Microsoft Excel.

### The modeling language

**Language Reference Manual**

Provides reference information about the Optimization Programming Language (OPL), the modeling language used in CPLEX® Studio.

**Language Quick Reference**

Contains succinct descriptions of individual keywords and functions, as well as the operators the and grammar for OPL and the scripting language for OPL. This document can be used as a reminder of OPL syntax.

**Advanced Feature: External functions**

Exposes the purpose and the context of external functions in OPL, and explains how to use an external knapsack algorithm, how to use other data sources, and how to debug custom Java™ code using Eclipse.

### Interfaces

The basic interface between the model development tools and the optimization engines is the ILOG® Concert Technology, which is a set of APIs in C++, .NET and Java, and the OPL programming language is built on top of Concert Technology. You can also use the optimization engines through their callable libraries, separately from OPL.

**OPL Interfaces**

IBM® ILOG OPL Interfaces enable users to integrate OPL models with IBM ILOG Concert. They are available in the C++, Java, and .NET programming languages. This manual provides a tutorial approach to using these application programming interfaces (APIs), and should be used in conjunction with the reference manual for the language you are using.

**oplrun Command Line Interface**

The `oplrun` command enables you to execute an OPL model or project from the Windows command line or in a UNIX environment.

**Overview of the APIs of CPLEX**

Provides links to reference manuals of the C, C++, and Java application programming interfaces. These navigational links are categorized by purpose for common tasks, such as creating or modifying a model, analyzing a solution, reading or writing files, and similar operations.

**CPLEX for Python users**

Shows how to use the Python API of CPLEX in a variety of ways. For example, you can use it to write scripts and applications that call CPLEX. Because of its interpreter, you can also use the Python API interactively.

### The optimization engines

**Advanced Programming Techniques**

This topic shows you how to apply query routines to gather information while CPLEX is working. It demonstrates how to redirect the search with goals or callbacks. It also covers user-defined cuts and pools of lazy constraints. It documents the advanced MIP control interface and the advanced aspects of preprocessing: presolve and aggregation. It also introduces special considerations about parallel programming with CPLEX.

**CP Optimizer Extensions User's Manual**

Offers explanations of how to use the advanced features of CP Optimizer effectively. While the modeling objects provided by IBM ILOG Concert Technology and the algorithms provided by the CP Optimizer engine will generally be sufficient to model and solve your problem, in some situations you may need the full flexibility of writing and maintaining the solution process in various ways, such as writing custom constraints and custom constructive search by means of goals. The extensions portion of CP Optimizer is not available in all APIs.

# Introducing ILOG CPLEX Optimization Studio
### Introduction

Provides an overview of IBM® ILOG® CPLEX® Optimization Studio.

IBM ILOG CPLEX Optimization Studio is a consolidation of the OPL integrated development environment and the CPLEX and CP Optimizer solution engines in a single product.

**CPLEX Optimization Studio** provides the fastest way to build efficient optimization models and state-of-the-art applications for the full range of planning and scheduling problems. With its integrated development environment, descriptive modeling language and built-in tools, it supports the entire model development process.

**CPLEX**, a feature of IBM ILOG Optimization Studio, offers state of the art performance and robustness in an optimization engine for solving problems expressed as mathematical programming models.

**CP Optimizer**, also a feature of IBM ILOG Optimization Studio, is a software library of constraint programming tools supporting constraint propagation, domain reduction, and highly optimized solution search.

### Information on ports

For the most recent information about CPLEX Optimization Studio ports, please refer to the Detailed System Requirements (DSR) or to the product support page: IBM Decision Optimization Support.

## Installing CPLEX Optimization Studio

Describes installation on different platforms.

### Installing on Windows

Launch the IBM® ILOG® CPLEX® Optimization Studio installer by double-clicking the executable in Windows Explorer. You need to have Administrator privileges to install in the default location. Depending on your user profile, you may need to launch the installer by selecting Run as Administrator from the context menu, usually accessed by a right click on the executable. The installer guides you through the choices for installation.

On Windows, the default installation location of IBM ILOG CPLEX Optimization Studio is:

```
C:\Program Files\IBM\ILOG\CPLEX_Studio2211
```

The installation location of the Community Edition is:

```
C:\Program Files\IBM\ILOG\CPLEX_Studio_Community2211
```

During installation you may have selected a different location, which will be referred to as `[install_dir]` in the rest of this topic.

**Note:** Important information

CPLEX Optimization Studio is delivered on the Windows platform as a single port. That port, named `x64_windows_msvc14`, is compatible with Visual Studio 2019 and Visual Studio 2022. For more details about the compatibility of Visual Studio versions with each other, please refer to [https://docs.microsoft.com/en-us/cpp/porting/binary-compat-2015-2017?view=vs-2019](https://docs.microsoft.com/en-us/cpp/porting/binary-compat-2015-2017?view=vs-2019 "(Opens in a new tab or window)").

This product requires the Microsoft Visual C++ Redistributable package (x64 version). You can download this package here: [https://aka.ms/vs/17/release/vc_redist.x64.exe](https://aka.ms/vs/17/release/vc_redist.x64.exe "(Opens in a new tab or window)").

IDE

You can launch the IDE using a **Start Menu** entry:

```
Start > All apps > CPLEX Optimization Studio 22.1.1 > CPLEX Studio IDE 22.1.1
```

For the Community edition:

```
Start > All apps > CPLEX Optimization Studio Community Edition 22.1.1 > CPLEX Studio IDE 22.1.1
```

**More information**

For more information on the CPLEX Optimizers on the Windows platform, see

```
[install_dir]\cplex\readmeWindows.html
```

For more information on the CP Optimizer on the Windows platform, see

```
[install_dir]\cpoptimizer\readmeWindows.html
```

### Installing on Linux

The Linux installer is an executable file. To launch an installation, the file should have execute permission and should be executed from the command line. For example, issue the command `./<installname>.bin`, where `<installname>` is the name of the installer. You can give a file execute permission with the command `chmod u+x <installname>.bin.`

On Linux, the default installation location of IBM ILOG CPLEX Optimization Studio is:

```
/opt/ibm/ILOG/CPLEX_Studio2211
```

The installation location of the Community Edition is:

```
/opt/ibm/ILOG/CPLEX_Studio_Community2211
```

During installation you may have selected a different installation location `([install_dir])`.

IDE

You can launch the IDE from a Linux terminal.

1. Open a terminal Window.
2. Change the directory to `[install_dir]/opl/oplide`.
3. Enter the command `./oplide`.


Or, from any terminal location, type the absolute path:

```
[install_dir]/opl/oplide/oplide
```

**More information**

For more information on the CPLEX Optimizers on the Linux platform, see

```
[install_dir]/cplex/readmeUNIX.html
```

For more information on the CP Optimizer on the Linux platform, see

```
[install_dir]/cpoptimizer/readmeUnix.html
```

## Installing on macOS

1. Double-click to unzip the cos_installer `<version>-osx.zip`
2. Double-click the `cplex_studio<version>-osp.app` and the installer guides you through the installation.

On macOS, the default installation location of IBM ILOG CPLEX Optimization Studio is:

```
/Applications/CPLEX_Studio2211
```
The installation location of the Community Edition is:

```
/Applications/CPLEX_Studio_Community2211
```

IDE

You can launch the IDE from the Finder: `[install_dir}/opl/oplide/Oplide`

**More information**

For more information on the CPLEX Optimizers on the macOS platform, see

`[install_dir]/cplex/readmeUNIX.html`

For more information on the CP Optimizer on the macOS platform, see

`[install_dir]/cpoptimizer/readmeUnix.html`

## Installing in another language

You can install CPLEX Optimization Studio in a language that is different from the one specified in your locale.

If you install in line mode (Windows or UNIX), the "-l" command-line argument uses the specified language code to set the locale for the installer. In this case, the "Choose locale" step is not proposed in console or GUI mode. For example, to install in Spanish, type:

`<installer_filename> -l es`

For macOS, type: `cplex_studio <version>-osx.app/contents/MacOS/cplex_studio <version>-osx -l es`

The language codes available for the installer are:

- `en` to install in English
- `fr` to install in French
- `de` to install in German
- `es` to install in Spanish
- `ja` to install in Japanese
- `zh` to install in Chinese
- `ko` to install in Korean
- `pl` to install in Polish
- `tr` to install in Turkish
- `pt_BR` to install in Brazilian Portuguese


