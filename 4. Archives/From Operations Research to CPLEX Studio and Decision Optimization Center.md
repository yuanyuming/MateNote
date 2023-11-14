# From Operations Research to CPLEX Studio and Decision Optimization Center
This overview of IBM ILOG CPLEX Studio and its main features is aimed at OR experts who are not familiar with CPLEX Studio and Decision Optimization Center.

## A quick start to CPLEX Studio

This Quick Start is for OR experts who are not familiar with the CPLEX Studio approach to the development and deployment of optimization models. It starts from a well known, hands-on example based on the _P-Median_ warehouse allocation problem. More detailed information on the concepts, terms, and procedures presented in this section is provided throughout the CPLEX Studio documentation set, in particular in the _Glossary_ and in _Getting Started with the IDE_.

### The Main window

The main window of the CPLEX Studio IDE, and a brief description of its primary controls and elements are presented here.

Tooltips appear when you move the pointer over most elements of the main window.

![[6900360a579e7544d4c529031f91caab_MD5.jpg]]

This annotated screen capture is provided just to give you an idea of what the CPLEX Studio integrated development environment (IDE) looks like when you are working with it.

Additional information on the IDE and how to work with it are presented in [Getting Started with the IDE](http://127.0.0.1:50160/help/topic/ilog.odms.ide.help/OPL_Studio/gsoplide/topics/opl_ide_gettingstarted_TOC.html "An Introduction to the CPLEX Studio IDE, and the Getting Started Tutorial explain how to launch the CPLEX Studio IDE, create an empty project, enter an OPL model, add data and a settings file, create run configurations and execute the final project.") and in the [IDE Reference](http://127.0.0.1:50160/help/topic/ilog.odms.ide.help/OPL_Studio/refoplide/topics/opl_ideref_TOP.html "Many of the IDE elements are described in the tooltips that are displayed when a mouse hovers over them. This document provides more detailed descriptions, and some explanations of how to use the IDE.") manual.

### Understanding OPL projects

CPLEX Studio handles OPL project files, data files, model files, setting files, and run configurations.

#### Projects / folders

CPLEX Studio uses the concept of a project to associate an OPL model file with one or more data files and one or more settings files. The project file in the root folder organizes all the related model, data and settings files.

IBM ILOG CPLEX Studio uses the concept of a _project_ to associate an OPL model (.mod) file with, usually, one or more data (`.dat`) files and one or more settings (.ops) files.

A project containing only a single model file is valid; data and settings files are optional. However, one project can contain several sets of model, data and settings files, the relationships between them being maintained by _run configurations_.

The OPL _model file_ declares data elements but does not necessarily initialize them. The _data files_ contain the initialization of data elements declared in the model.

The `.project` file in the root folder for the OPL project organizes all the related model, data and settings files. Run configurations, which are maintained in an `.oplproject` file, also provide a convenient way to maintain the relationship between related files and runtime options for the environment (see also [Run configurations](http://127.0.0.1:50160/help/topic/ilog.odms.ide.help/OPL_Studio/oplquickstart/topics/opl_quickstart_runconfigs.html "Run configurations are a way of handling model, data, and settings files within a project.")).

When you are about to write a new model in CPLEX Studio, the dialog box that appears allows you to name your project, give your project a description, and choose whether you want to create a data file or a settings file. The description of the project may be useful later to better differentiate between projects with similar names. This is explained in detail in [Getting Started with the IDE](http://127.0.0.1:50160/help/topic/ilog.odms.ide.help/OPL_Studio/gsoplide/topics/opl_ide_gettingstarted_TOC.html "An Introduction to the CPLEX Studio IDE, and the Getting Started Tutorial explain how to launch the CPLEX Studio IDE, create an empty project, enter an OPL model, add data and a settings file, create run configurations and execute the final project.") and in the [IDE Reference](http://127.0.0.1:50160/help/topic/ilog.odms.ide.help/OPL_Studio/refoplide/topics/opl_ideref_TOP.html "Many of the IDE elements are described in the tooltips that are displayed when a mouse hovers over them. This document provides more detailed descriptions, and some explanations of how to use the IDE.") manual.

A minimal project has:

- one OPL model file

- one default run configuration referencing that same model file

A typical project has:

- one or more OPL model files

- any number of data files or no data file

- any number of settings files or no settings file

- one or more run configurations referencing various combinations of those model, data, and settings files. (A run configuration cannot have more than one model file.)

#### OPL model files

Model (.mod) files contain all your OPL statements. The data and the objective function are not mandatory and there may be more optional components, such as scripting statements, in a model file.

Model (.mod) files contain all your OPL statements. The data and the objective function are not mandatory and there may be more optional components, such as scripting statements. Note that you can also generate a model file in a compiled form (.opl) from the IDE for execution through the OPL interface libraries (see [Generating a compiled model](http://127.0.0.1:50160/help/topic/ilog.odms.ide.help/OPL_Studio/refoplide/topics/opl_ideref_proces_output_compil.html "Describes how to generate a binary version of a model file.")). The components of a model file are covered in the following sections.

##### Declarations of data

Data declarations allow you to name your data items so that you can reference them easily in your model. For example, if your data in a table defines the cost of shipping one unit of material from location _i_ to location _j_, you might want to call your item of data _cost_ij where _i_=1, . . . , _n_ and _j_=1, . . . , _n_ and _n_ is the number of locations in your model. You tell OPL that your model uses this data by declaring:

```

int n = . . . ;
float cost[1..n][1..n] = . . . ;
```

The **. . .** (ellipsis) means that the values for your table are located in a data file, which must be listed in the current project.

You could also list the data explicitly in the model file. However, it is recommended that you construct model files without specifying values for data so that you can later easily solve many instances of the same model by simply changing the data file. See also [Run configurations](http://127.0.0.1:50160/help/topic/ilog.odms.ide.help/OPL_Studio/oplquickstart/topics/opl_quickstart_runconfigs.html "Run configurations are a way of handling model, data, and settings files within a project.").

Note that the `int` type declared means that the numbers in the data file must be integers. If the numbers in the data file are floating-point numbers, use the `float` type instead.

##### Declarations of decision variables

In an OPL context, as opposed to IBM ILOG Script and to the general programming context, variables are decision variables. Declarations of decision variables name, and give the type of, each variable in the model. For example, if you want to create a variable that equals the amount of material shipped from location _i_ to location _j_, you can create a variable named _ship_ij.

```

dvar float+ ship[1..n][1..n];
```

That statement declares an array of non-negative floating-point variables. (That is what `float+` means). The `dvar` keyword indicates that you are declaring a decision variable.

##### An objective function

The objective function is a function that you want to optimize. This function must consist of variables and data that you have declared earlier in the model file. The objective function is introduced by either the `minimize` or the `maximize` keyword. For example,

```

minimize sum(i,j in 1..n) cost[i][j]*ship[i][j];
```

That statement indicates that you want to minimize the sum of the shipping costs for each origin-destination pair.

##### Constraints

Constraints indicate the conditions necessary for a feasible solution to your model. You declare constraints within a `subject to` block. For example,

```

subject to {
   forall(j in 1..n) sum(i in 1..n) ship[i][j] == demand[j];
}
```

That statement declares one set of constraints. There is a constraint for each destination. (That is what the `forall` keyword indicates.) The constraint for each destination states that the sum of material shipped to that destination must equal the demand at that destination. The symbol `==` indicates equals within a constraint block. The symbol `<=` indicates less than or equal to. The symbol `>=` indicates greater than or equal to.

#### Data files

By separating the model of the problem from the instance data, you can organize large problems better. Each set of data is stored in a separate data file.

You can organize large problems better by separating the model of the problem from the instance data. Each set of data is stored in a separate data file, with a .dat extension.

In this case, you store the instance data in one or more data files (.dat). Data files (.dat) store the values of the data used in the model. If you declare the data as suggested in this tutorial, your data file will look something like this:

```

n = 3;

c = [[0.0 1.5 2.3]
     [1.5 0.0 3.7]
     [2.3 3.7 0.0]];
```

Each data file may specify one or more connections to data sources, such as a relational database or a spreadsheet, to read and write data.

#### Settings files

If you change the default values of settings, the new user-defined values are stored in the settings file associated with a project.

Settings files (.ops) are where your user-defined values are stored when you decide to change the default values of OPL language options, constraint-programming (CP Optimizer) parameters, or mathematical-programming (CPLEX) parameters.

Settings apply only to the model included in the run configuration, not to the submodels loaded and solved.

#### Run configurations

Run configurations are a way of handling model, data, and settings files within a project.

Basically, a run configuration is a variation of a given project for execution purposes. It combines at least a model file and, optionally, one or more data files and one or more settings files within the project, while addressing the same mathematical problem. You can define as many run configurations as you need within a given project. Typically, you use run configurations to test, improve, and fine-tune your OPL projects.

For example, you can:

- keep two sets of data: a simple one for quick prototyping and a larger one to work closer to your business case

- keep one configuration for each set of MP options (CPLEX parameters) that makes sense for your problem.

Practically, run configurations appear as sublevels in the Projects tree.

### Modeling the P-Median problem with OPL

The P-Median problem is a well known warehouse allocation problem in Operations Research.

The _P-Median_ problem is a well known warehouse allocation problem in Operations Research. The problem can be stated very simply, like this: given a set of customers with known amounts of demand, a set of candidate locations for warehouses, and the distance between each pair of customer-warehouse, choose `P` warehouses to open that minimize the demand-weighted distance of serving all customers from those `P` warehouses.

A standard textbook would probably write out the P-Median problem like this:

#### Data

- P = number of facilities to locate
- I = set of customers
- J = set of candidate locations for warehouses
- hi = demand for customer i
- dij = distance between customer i and candidate warehouse j

#### Decision variables

- xj = 1 if candidate warehouse j is used; 0 otherwise
- yij = 1 if demand for customer i is satisfied by warehouse j; 0 otherwise

#### Objective

Minimize the demand-weighted distance of delivering to customers.

Or, expressed as an equation:

![[bb68ab7079265b50ac9683eec5ecc1a1_MD5.jpg]]

#### Constraints

- 1st constraint makes sure that each customer is served by exactly one warehouse.
- 2nd constraint makes sure that P warehouses are built.
- 3rd constraint makes sure that a customer is not served by an unopened warehouse.

Or, expressed as equations:

![[1330fd9ce72343f851ae4e14724f3451_MD5.jpg]]

![[6964195a6c55c149feee7215d2c83712_MD5.jpg]]

|![[7a41463c0b80e6640184a1a337979b0a_MD5.jpg]]|![[8af84cc9d2fcb6114d4843a5612a3b78_MD5.jpg]]|![[1fbe151831c91b87bc4f62454d51723e_MD5.jpg]]|
|---|---|---|
|![[3354b434cee27a87e686f21d2c181d89_MD5.jpg]]|![[1fbe151831c91b87bc4f62454d51723e_MD5.jpg]]||
|![[4a5d8562f82b0b5e13bd2d580410a666_MD5.jpg]]|![[8af84cc9d2fcb6114d4843a5612a3b78_MD5.jpg]]|![[1fbe151831c91b87bc4f62454d51723e_MD5.jpg]]|

The construction of an OPL model file (.mod) follows the same format exactly. The P-Median problem can be formulated in OPL like this:

```

//Data
int P = ...;
{string} Customers = ...;
{string} Warehouses = ...;
int Demand[Customers] = ...;
float Distance[Customers][Warehouses] = ...;

//Variables
dvar boolean OpenWarehouse[Warehouses];
dvar boolean ShipToCustomer[Customers][Warehouses];

//Objective
minimize 
  sum( c in Customers , w in Warehouses ) 
    Demand[c]*Distance[c][w]*ShipToCustomer[c][w];

//Constraints
subject to {
  forall( c in Customers )
    ctShip:
      sum( w in Warehouses ) 
        ShipToCustomer[c][w] == 1;

  ctOpen:
    sum( w in Warehouses ) 
      OpenWarehouse[w] == P;

  forall( c in Customers , w in Warehouses )
    ctShipOpen:
      ShipToCustomer[c][w] <= OpenWarehouse[w];
}

tuple ShipToCustomerSolutionT{ 
	string Customers; 
	string Warehouses; 
	int value; 
};
{ShipToCustomerSolutionT} ShipToCustomerSolution = {<i0,i1,ShipToCustomer[i0][i1]> | i0 in Customers,i1 in Warehouses};
tuple OpenWarehouseSolutionT{ 
	string Warehouses; 
	int value; 
};
{OpenWarehouseSolutionT} OpenWarehouseSolution = {<i0,OpenWarehouse[i0]> | i0 in Warehouses};
```

Notice that:

- the names of the customers and warehouses are specified as sets of strings in the data file. (That is what the notation `{string}` means.)

- it is also possible to use sets of integers as the labels for the customers and warehouses. You can also use ranges instead of sets. The demand and distance data remain the same, regardless of the format of the labels for customers and warehouses.

- the `...` (ellipsis) syntax means that the data is initialized externally, that is, from a data file (pmedian.dat).

```
    P=2;
    Customers={"Albert","Bob","Chris","Daniel"};
    Warehouses={"Santa Clara","San Jose","Berkeley"};
    Demand=[100,80,80,70];
    Distance=
    [[ 2 , 10 , 50 ],
     [ 2, 10, 52 ],
     [ 50, 60 , 3],
     [ 40 , 60 , 1]];
```

### Two solving engines

Two solving engines underlie OPL: CPLEX and CP Optimizer. The CPLEX engine for mathematical programming is used by default, the CP Optimizer engine for constraint programming is called if your model requests it.

After the model, data, and settings files are complete, use the Run button ![[ed56b12bb3faf0ac09ffb105955f3e71_MD5.png]] or the menus in the Projects Navigator to run your model.

The time it will take to solve a model naturally depends on the size and complexity of the model. Typical textbook problems like the P-Median problem usually solve very quickly. If the solver finds a feasible solution, it displays the solution in the Solutions tab of the Output Area. (See [The Main window](http://127.0.0.1:50160/help/topic/ilog.odms.ide.help/OPL_Studio/oplquickstart/topics/opl_quickstart_main.html "The main window of the CPLEX Studio IDE, and a brief description of its primary controls and elements are presented here.").) The solver will continue working until an optimal solution is found or until you click the Abort button.

OPL supports two solving engines:

- the CPLEX engine for mathematical programming is used by default when you run your project, if your model does not start with the statement `using CP;`. This is the case of the P-Median problem described in the [Modeling the P-Median problem with OPL](http://127.0.0.1:50160/help/topic/ilog.odms.ide.help/OPL_Studio/oplquickstart/topics/opl_quickstart_pmedian.html "The P-Median problem is a well known warehouse allocation problem in Operations Research.").

- the CP Optimizer engine for constraint programming is called if your model starts with the statement `using CP;`. You can write, edit and solve the model from the CPLEX Studio IDE, from the `oplrun` command line tool, and from the APIs.

You will find more information on CP modeling and solving in the documentation set. In particular, [Constraint programming versus mathematical programming](http://127.0.0.1:50160/help/topic/ilog.odms.ide.help/OPL_Studio/opllanguser/topics/opl_languser_intro_cp_vs_mp.html "Explains why it makes sense to compare CP and MP, and provides details on the salient features of each approach.") in the _Language User’s Manual_ presents the differences between MP models and CP models.

### Debugging and dealing with error messages

CPLEX Studio checks for and displays syntax errors and solving errors.

#### Syntax errors

Syntax and semantic errors are displayed dynamically in the Problems tab as you type.

For example, a common error is to forget to put a semicolon at the end of a statement. If you omit the semicolon at the end of the line

```

int P = ...;

```

the Problems tab displays the description, location, and source file of the error.

![[7b2fcea185b44d371aabd3c08a3a3b4b_MD5.jpg]]

Generally, error messages will look similar to this example.

#### Solving errors

Immediately after you run your project, OPL checks for errors that prevent the solver from running. If such errors are found, one or more error messages will be displayed in the Problems tab.

### Displaying solutions

You can view solutions to your problems in CPLEX Studio, both while the solver is running and after the solving has finished.

It is possible for you to view solutions while the solver is running, as well as after it has finished. In addition to the Solutions tab of the Output Area, you can view a solution in tabular form through the Problem Browser. (See [The Main window](http://127.0.0.1:50160/help/topic/ilog.odms.ide.help/OPL_Studio/oplquickstart/topics/opl_quickstart_main.html "The main window of the CPLEX Studio IDE, and a brief description of its primary controls and elements are presented here.").) If your model expresses a MIP problem that generates feasible solutions, you can see the solution pool in the Problem Browser and further populate it with more nonoptimal solutions. (You can also see feasible solutions in the Solutions tab if certain language settings are selected; see [After running a project](http://127.0.0.1:50160/help/topic/ilog.odms.ide.help/OPL_Studio/refoplide/topics/opl_gui_mainwin_pb.html#refoplide.uss_ide_guiref.1010436__section1207236195515) and [Setting language options](http://127.0.0.1:50160/help/topic/ilog.odms.ide.help/OPL_Studio/oplparams/topics/opl_params_langoptions_setting.html "How to consult or change OPL language options.").)

You can see variable values in the Problem Browser, which also contains information about data structures, data values, labeled constraints and sensitivity data, as well as postprocessing data.

### Summary: what you can do with the CPLEX Studio IDE

This summary contains a succinct list of the CPLEX Studio IDE features.

The IBM ILOG CPLEX Studio IDE is an integrated development environment for mathematical programming, constraint programming, and combinatorial optimization applications in general. It is the graphical user interface (GUI) for OPL (the Optimization Programming Language) and IBM ILOG Script, the scripting language for OPL.

With the CPLEX Studio IDE you can:

- Create and modify project files, as well as model and data, using the editing capabilities

- Create and modify settings files to apply language options, mathematical programming parameters and constraint programming parameters

- Execute a project

- Visualize OPL results in text or tabular form

- Search for relaxations of variables and constraints, and for conflicts between constraints in infeasible models

- Identify the time and memory consumed for the execution of a project

- Work with IBM ILOG Script, the OPL scripting language

- Debug scripts using the debug facilities

- Generate a compiled model

- Generate external data files or internal data files in various formats

- Visualize the state of variables at some point during the search for a solution

- Connect to a database or to a spreadsheet to read and write data

- Set preferences for the appearance of the IDE

- and carry out many other tasks

## From problem solving to what-if scenarios: IBM Decision Optimization Center

Presents IBM Decision Optimization Center, a solution for the development and deployment of optimization-based planning and scheduling applications.

### Decision Optimization Center - Overview

Presents a short overview of IBM Decision Optimization Center.

IBM ILOG CPLEX Studio is integrated with a companion product - IBM Decision Optimization Center. Decision Optimization Center is both a tool for application development and a runtime environment for the distributed applications, and the combined product is a complete solution for the development and deployment of optimization-based planning and scheduling applications.

In essence, you supply the mathematical model in OPL, and Decision Optimization Center supplies the GUI and the interactivity with your model that makes it easy to use for operations managers and planners. Decision Optimization Center is designed for OR professionals who want to easily create and configure solutions for their users in the CPLEX Studio IDE, without the need for programming skills.

Applications built with Decision Optimization Center allow users to adjust assumptions, operating constraints and goals for planning and scheduling resources, and see the results in familiar business terms, providing extensive what-if analysis and scenario comparison features “out of the box.”

For corporation-wide applications, Decision Optimization Center allows you to build distributed applications (both remote execution and multi-user), and offers an extensive platform for customization using Java.

### How CPLEX Optimization Studio and Decision Optimization Center integrate

Describes the architecture of IBM ILOG optimization and the interactivity of its components.

IBM provides a complete set of tools for building custom optimization-based decision support applications, which includes:

- **CPLEX Optimization Studio** – A complete system for rapid development and deployment of optimization models. This consists of:

    - The **OPL** language.

    - **CPLEX Optimizers**, containing CPLEX, a mathematical programming engine that solves the full range of LP and MIP problems encountered in the real world.

    - **CP Optimizer**, a constraint programming engine that solves complex scheduling and routing problems.

    - The **IDE**, a tightly integrated IDE supporting model development and testing.

- **Decision Optimization Center**, a tool that automatically generates a business application based on the structure of your OPL model.

![[32513eec834ff9ec73c8ec5be23b83b8_MD5.jpg]]

OR = Operations Research, IT = Information Technology, LoB = Line of Business

IBM makes optimization more widely accessible than ever before, because it offers a wide range of capabilities across several fundamental dimensions, typically:

- **Supporting many types of optimization applications:** From off-line strategic planning applications through detailed scheduling to real-time operational applications.

- **Supporting the complete model development and application life-cycle:** Complete support for the application development process, from quick prototyping through model and application refinement, to application deployment and maintenance.

- **Supporting multiple personas:** OR and IT professionals, together with operations and business managers, can now collaborate in entirely new ways to rapidly generate custom decision-support applications.

### Rapid development with tightly integrated CPLEX Studio and Decision Optimization Center

Describes the features and benefits of Decision Optimization Center.

Developing an application with IBM ILOG CPLEX Studio and IBM Decision Optimization Center is very easy and productive.

The integration comes with a wizard that automatically generates a Decision Optimization Center application based on the structure of your OPL model.

- OPL data structures such as arrays and tuple sets are mapped to input data tables and graphical views in Decision Optimization Center. Because they are editable, users can then play out scenarios in Decision Optimization Center based on data changes.

- Mathematical constraints from your OPL model can be exposed as Decision Optimization Center _requirements_ (soft constraints) with priorities, allowing a business user to make trade-offs between conflicting business requirements and alternative relaxations.

- The objectives of your mathematical model are mapped to Decision Optimization Center _goals_, which allow interactive goal programming and balancing between multiple objective criteria.

- Decision variables in the model are represented as solution views in Decision Optimization Center, and can be configured to show aggregate values and key performance indicators (KPIs), as well as providing exporting to Excel and integration with reporting tools.

The generated Decision Optimization Center application is configurable through editors inside CPLEX Studio, and as the model evolves it can be extended to take new business requirements into account. The following figure shows how a chart view in Decision Optimization Center is configured in CPLEX Studio.

![[bbc10891ea6187d999eb3a75ca1ae449_MD5.jpg]]

Developing an application with CPLEX Studio and Decision Optimization Center also allows business users to take part in the rapid prototyping and iterative development needed to strengthen definitions of requirements, refine models, perfect scenario parameters, and examine KPIs, solution views, and business goals.

Note:

If you are reading this because you use CPLEX Studio, but without access to Decision Optimization Center, please contact your IBM sales representative.