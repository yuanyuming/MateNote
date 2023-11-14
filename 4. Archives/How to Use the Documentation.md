## How to Use the Documentation
Read this section to understand how to navigate in the documentation for CPLEX Studio, and to learn what the documentation prerequisites, notation, and naming conventions are.
- **Prerequisites - what you should know**
To benefit fully from CPLEX Studio documentation, you are expected to have a knowledge of either Windows or Unix operating systems and of modeling optimization problems.
- **The documentation formats**
Explains the different documentation formats that are provided for CPLEX Studio.
- **Accessing the documentation**
Context-sensitive help (also called Dynamic Help) is available on many elements in the IDE
- **Navigating in the documentation set**
Become familiar with the order in which to read the CPLEX Studio documentation, with prerequisites and naming conventions.
- **Where to find information on special characters**
Special characters used in OPL and script operators, such as |, ||, &, &&, can be found in the _OPL Language Quick Reference_ manual.
### Prerequisites - what you should know
To benefit fully from CPLEX Studio documentation, you are expected to have a knowledge of either Windows or Unix operating systems and of modeling optimization problems.
The present documentation assumes that you are familiar with:
- The Windows or Unix environments in which you are going to use CPLEX Studio.
- The modeling of optimization problems. However, a detailed understanding of solving algorithms is not required.
Additionally, the sections on embedding models into applications also assume that you are familiar with the programming language and environment from which you access CPLEX Studio: Microsoft Visual Studio .NET, or C++, or Java.
### About the online help
The complete documentation set is provided as online help, along with links to the CPLEX Studio web site and a model library.
The online help provides the following features:
- Integration of the full online documentation set.
- A link to the CPLEX Studio home page on the IBM ILOG web site (when connected to the Internet).
- A link to the OPL model library on the IBM ILOG web site (when connected to the Internet). You can download a model and use it as a basis for creating your own model.
On Windows platforms, the online documentation is provided as online help, accessible from the IDE.
To launch the online help, press the F1 key, or select Help > Dynamic Help from the menu bar. Then, select an element by clicking on it to display the associated help text.
For example, click on an OPL keyword in the model editor to display the _keyword help_. If you press F1, the focus moves away from the keyword to the editor itself, and the help text for the editor is displayed.
The keyword help provides a quick reference to OPL and IBM ILOG Script statements, functions, and methods.
In addition, if you click on certain elements of the graphical user interface, the context-sensitive help is displayed for those elements.
### Using the Dynamic Help
Dynamic Help (or context-sensitive help) is available on many elements in the IDE.
Display the help window in the IDE and view Dynamic Help.
1. From the main menu, choose **Help>Dynamic Help** or press the F1 key.
2. A Dynamic Help window appears in the IDE:
![[dynamic_help[1].png]]
If your cursor was on a keyword in an editor when you pressed F1, context-sensitive help for that keyword will be displayed.
If not, the Help window will appear as it does in the previous screen capture; you can then locate the items you want using the following options at the top of the window:
- Contents — displays a clickable table of contents of the entire documentation set.
- Search — displays a search field in which you can enter any topic and search for it in the documentation.
- Related Topics — if a topic is selected in the Help window, clicking this button will display a list of other topics that are related to it.
- Bookmarks — allows you to navigate to bookmarks you have previously created.
- Index — displays a clickable index for the entire documentation set.
3. When the Help window is open, click on any keyword (highlighted in blue) in a model file that is open in the editor to display help for it. In the following example, the user has clicked the `range` keyword in the model file. By clicking range in the Help panel, the documentation for the `range` keyword will be displayed.
![[dynamic_help_with_kw[1].png]]
To see Help on popup windows:
- Click on the Help icon![[icon_opl_help_question_mark[1].png]]. A Dynamic Help window will appear next to the popup window with Help for that window.
Note:
In the IDE, not all windows that display a Help icon![[icon_opl_help_question_mark[1] 1.png]] will display Help contents.
To see Help on the Settings editor:
- When editing a settings (`.ops`) file, click on the Tooltip icon![[icon_opl_settings_tooltip[1].png]]. A tooltip will appear for that line item:
![[icon_opl_settings_tooltip_result[1].jpg]]
### Navigating in the documentation set
Become familiar with the order in which to read the CPLEX Studio documentation, with prerequisites and naming conventions.
- **Where to start**
Here you will find a few tips on how to quickly find the information you need in the various documentation items.
- **Learning about the CPLEX Studio IDE**
You can navigate to various documents that help you learn how to use the IDE of CPLEX Studio.
- **Learning the OPL language**
The _Language Reference Manual_ presents the concepts for modeling data and describes the structure and language of IBM ILOG Script. The _Language User's Manual_ contains tutorials for both OPL and IBM ILOG Script.
- **Learning the application programming interfaces (APIs)**
Provides tips on where to find information to help you learn the OPL application programming interfaces (APIs).
- **Notation and naming conventions**
Lists the abbreviations, naming and notation conventions, and other visual clues used in the documentation.
#### Where to start
Here you will find a few tips on how to quickly find the information you need in the various documentation items.
To access documentation items:
1. If you are wondering whether your computer platform is supported, read **Working Environment**.
2. If you are an OR expert but don’t know anything about CPLEX Studio, read **A quick start to CPLEX Studio** first.
3. Then read the Release Notes for your version of CPLEX Studio, for an overview of the main changes in the new release. The Release Notes can be found in the introduction to IBM ILOG CPLEX Optimization Studio.
If you are familiar with the IDE from releases 3.x, 4.x or 5.x but are not familiar with the OPL 6.x or CPLEX Studio IDE, you need to read the **Introduction to the CPLEX Studio IDE** "Provides an overview of important concepts and features of the CPLEX Studio IDE that you should be familiar with before starting to work with it.") section of _Getting Started_.
### Learning about the CPLEX Studio IDE
You can navigate to various documents that help you learn how to use the IDE of CPLEX Studio.
To get familiar with the product and its graphical user interface if you are working on a Windows platform, go to **Getting Started Tutorial** "A tutorial in which you launch the IDE, create an empty project, enter an OPL model, add data, add a settings file, create run configurations and execute them. More tutorials elaborate on IDE features in IDE Tutorials."). You can also acquire more in-depth knowledge of the IDE features in _IDE Tutorials_. If you need a reminder of what this button or that setting option does, go to the **The Graphical User Interface** "Describes the OPL editor, search functions, how to export models for debugging, and how to change IDE preferences.").
**Note:**
Within the IDE itself, you can access the whole documentation set by choosing Help > Help Contents from the IDE's main menu, and you can also access the integrated _keyword help_ by pressing F1 on a selected keyword.
### Learning the OPL language
The _Language Reference Manual_ presents the concepts for modeling data and describes the structure and language of IBM ILOG Script. The _Language User's Manual_ contains tutorials for both OPL and IBM ILOG Script.
For more information on the language, including how OPL supports constraint programming, read **OPL, the modeling language** "Presents the modeling language of IBM ILOG OPL, namely: the overall structure of OPL models; the basic modeling concepts; how data can be initialized internally as it is declared or externally in a .dat file; how to connect to, read from, and write to databases and spreadsheets; expressions and relations; constraints; and formal parameters."), the _IBM ILOG Script Reference Manual_, and the **Language overview** "Explains why modeling languages were created, presents and compares math programming and constraint programming, and provides a brief introduction to scripting with references for more information.") in the _Language User's Manual_.
As part of IBM ILOG CPLEX Studio, the Optimization Programming Language is documented in two manuals, both partly based on Pascal Van Hentenryck’s book, _The OPL Optimization Programming Language_, published by The MIT Press, 1999, Cambridge, Massachusetts.
- The _Language Reference Manual_ explains what an OPL model is, presents the concepts for modeling data, describes expressions and relations, constraints, and formal parameters, and describes the structure and language of IBM ILOG Script.
- The _Language User’s Manual_ is composed in most part of tutorials to both OPL and IBM ILOG Script:
    - Part I describes the modeling language. Each chapter reviews some aspect of OPL in detail. These technical chapters are preceded by a short tour of OPL to introduce the main concepts and the computation model.
    - Part II applies OPL in the area of linear and integer programming and constraint programming.
    - Part III explains how to use IBM ILOG Script, a language for combining, and interacting with, OPL models.
    - Part IV explains how you can interact with external code written in other programming languages.
### Learning the application programming interfaces (APIs)
Provides tips on where to find information to help you learn the OPL application programming interfaces (APIs).
If you want access to your model data, to the solutions, to the engine API, and other advanced features of the C++, Java, and .NET API, read **Working with OPL interfaces** "Explains in more general terms how to work with the OPL C++, Java and .NET Interfaces. This section is also illustrated by code samples for each language.") in the _Interfaces User's Manual_ and the API reference manual for each programming language.
### Notation and naming conventions
Lists the abbreviations, naming and notation conventions, and other visual clues used in the documentation.
Important:
Make sure you read the CPLEX Studio Release Notes to learn about the changes of keywords, operators, and language syntax.
Throughout this manual, the following conventions apply:
- **IBM ILOG CPLEX Optimization Studio** is frequently referred to as CPLEX Studio. The CPLEX Studio IDE, or the IDE for short, designates the graphical user interface and development environment of CPLEX Studio.
- **CP** is used as an abbreviation for constraint programming. A CP model is an OPL model that is written in constraint programming syntax (whenever it is specific) and will be solved by the CP Optimizer engine.
- **MP** is used as an abbreviation for mathematical programming. An MP model is an OPL model that is written in mathematical programming syntax (whenever it is specific) and will be solved by the CPLEX engine.
- Model file names have the `.mod` extension. Therefore, “model file” and “.mod file” are two equivalent expressions.
- Data file names have the `.dat` extension. Therefore, “data file” and “.dat file” are two equivalent expressions.
- Settings file names have the .ops extension. Therefore, “settings file” and “.ops file” are two equivalent expressions.
- Since the OPL Projects Navigator in the IDE displays projects as tree structures of project, model, data, and settings files, “OPL Projects Navigator” and “project tree” are two equivalent expressions.
- Important terms and ideas are emphasized either in _italics_ or in bold.
- Class, method, and parameter names appear in this typeface.
- Code extracts appear `in this typeface`. In web browsers, they appear on a color background, like this:
```
    
    dvar int nbRabbits in 0..20; 
    dvar int nbPheasants in 0..20; 
    subject to {
        20 == nbRabbits + nbPheasants; 
        56 == 4*nbRabbits + 2*nbPheasants; 
    }; 
    
 ```
- Angle brackets denote placeholders.
- Menu commands from the IDE appear as File > Open.
### Where to find information on special characters
Special characters used in OPL and script operators, such as |, ||, &, &&, can be found in the _OPL Language Quick Reference_ manual.
The search function in the Eclipse format ignores special characters, such as |, ||, &, &&, used in OPL operators and IBM ILOG Script operators. The complete list of the [Operators](http://127.0.0.1:50160/help/topic/ilog.odms.ide.help/OPL_Studio/opllang_quickref/topics/opl_operators.html "Presents OPL and IBM ILOG Script operators and their order of precedence.") can be found in the _Language Quick Reference_.