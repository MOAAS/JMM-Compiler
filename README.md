# COMP - JMM Compiler (Group 5D)

Group members:

* Alexandre Carqueja, up201705049, Grade: 20, Contribution: 25%
* Daniel Brandão, up201705812, Grade: 20, Contribution: 25%
* Henrique Santos, up201706898, Grade: 20, Contribution: 25%
* Pedro Moás, up201705208, Grade: 20, Contribution: 25%

## Summary

The project is a compiler for programs in the Java-- language. It first performs a lexical, syntactic and semantic analysis, finally generating jasmin code that will become a class file. There are also two compiler options: "-r <n>", in which the compiler tries to assign the local variables used in each function of each Java-- class to the first <n> local variables of the JVM (or to the maximum local variables of the JVM when n is greater than the maximum), and "-o", which enables a set of code optimizations.

## Execution

To execute, run the command

`java –jar jmm.jar [-r <num>] [-o] <input_file.jmm>`

## Syntax Errors

An error message will be shown when the compiler finds a syntax error. In order to simplify the syntactic analysis, our parser only reports custom errors when inside the while expression, reporting a maximum of 10 errors. Errors outside the while expression will cause the compilation to stop. The following error messages can be shown.

Note: for all errors, a line and column is shown
- "The expression is missing a '(' after the while keyword"
- "The expression is missing a ')' at the end"
- "The expression is missing an argument after the operator [&& | < | ...]"
- "The expression is missing an argument before the operator [&& | < | ...]"
- "The expression value is invalid! An X is not valid in this context."
- "The expression cannot be empty."
- "The expression is missing a closing bracket ']'"

## Semantic Analysis

When a semantic error is found, the compiler does not stop its execution, but will not move past semantic analysis when it is done.
Semantic analysis may display the following errors:

Note: for all errors, a line and column is shown. When there is an unexpected type, the found type is displayed.
- "Assignment of different types. Can't assign X to Y"
- "If expression is not a boolean."
- "While expression is not a boolean."
- "Array size must be an int..."
- "Array must be of type int[]..."
- "Array index is not an int..."
- "Left/Right operand of + is not an int..." (Indicates whether the error is on the left or right)
- "Left/Right operand of - is not an int..."  (Indicates whether the error is on the left or right)
- "Left/Right operand of * is not an int..."  (Indicates whether the error is on the left or right)
- "Left/Right operand of / is not an int..."  (Indicates whether the error is on the left or right)
- "Left/Right operand of < is not a boolean..."  (Indicates whether the error is on the left or right)
- "Left/Right operand of && is not a boolean..."  (Indicates whether the error is on the left or right)
- "Operand of ! is not a boolean..."
- "Tried to call ".length" on non array..."
- "Class X does not contain static method Y"
- "Method X is not static"
- "Symbol X does not exist"
- "Class X does not contain method Y"
- "Method X is static"
- "Can't extend class from itself"
- "Extended class was not imported"
- "Variable X has not been initialized"
- "Variable X may not have been initialized"
- "Invalid import declaration X, constructor cannot be static"
- "Invalid import declaration X, constructor cannot return a value"
- "Duplicate import declaration: X."
- "Duplicate class declaration: X."
- "Duplicate main method for class: X"
- "Duplicate method declaration: X"
- "Duplicate method variable name X"
- "Duplicate variable name X"
- "Invalid variable type: X"
- "Such constructor does not exist: X"
- "Cannot use 'this' in static function"

Some warnings may also be displayed, but these will still allow the compiler to go to the code generation phase.
- "Variable X may not have been initialized"
- "Duplicate import declaration: X."

If the compiler is run with the "-o" optimization, it may even show the following warnings:
- "Division by zero"
- "If expression will always be true"
- "If expression will always be false"
- "While expression will always be true"
- "While expression will always be false"

## Intermediate Representations

The High-level IR we used consists of an Abstract Syntax Tree (AST). The AST contains all the required information needed to build the symbol table and perform the code generation. We did not develop a LLIR.

## Optimizations

For the -r option, the compiler tries to assign the local variables used in each function of each Java-- class to the first <n> local variables of the JVM. Nevertheless, the compiler will always try to minimize the number of registers used, even if it has been allowed to use more than it actually needed.

For the -o option, we have decided to implement a set of small optimizations, that combined may achieve great potential. They are performed in the specified order. All of these perform their changes directly to the AST.

* Constant propagation: Substitutes, at compile time, variables that contain known constants. (e.g a = 4; b = a; -> a = 4; b = 4;)
* Constant folding: Constant expressions will be calculated at compile time (e.g 4 * 1 - 71 * 2 -> 138)
* Expression simplification: Arithmetic and Boolean Expressions will be simplified as much as possible. (e.g  a = x / x; b = 0 * (x + y + z); -> a = 1; b = 0; )
* Dead code elimination: When if/else/while conditions have known values, unreachable code will be removed. That includes while(false) { anything... }, if (true) { } else { anything... }, if (false) { anything...} else { anything... }, etc.
* Loop unrolling: When a loop's number of iteration is known, it will try to repeat its contents in order to minimize goto instructions, by finding a number which is multiple of the number of iterations.

Without any options enabled, the compiler always tries to optimize the JVM instructions it uses, such as:

* iconst_x, bipush, sipush, ldc: chooses the lowest cost option it can use depending on the integer it needs to push
* iinc: used when a local variable is incremented by a constant value (e.g i = i + 2)
* ineg: when a variable is subtracted to 0 (e.g 0 - x)
* iflt, if_icmplt, ifne: when on an if statement, chooses the option that will cause the least instructions (e.g if(i < 0) will use iflt/ifge, if(x < y) will use if_cmplt/if_cmpge, and if(obj.returnBoolean()) will use ifne/ifeq
* ishl, ishr: used when a multiplication/division with a power of 2 happens (e.g i * 4 will become i << 2)

## Code generation

The code generation phase is done recursively, by traversing the AST. Each type of node will print its own instructions, possibly analyzing its children  in order to find out which instructions will be most suited. It can also access the symbol table, in order to find out a variable's assigned register.

After this phase, the .j file can be found in the same folder as the jmm file.

## Overview

Overall, most of the code generation and optimizations were implemented by recursively traversing the AST on the class SimpleNode, and when a certain type of node wants to do something when reached, it simply overrides that method.

After all the steps have been completed, a .j file and .class file are generated (assuming jasmin.jar is found on the jasmin-2.4 folder).

## Task distribution

* Alexandre Carqueja: CP1: Syntactic Analysis, CP2: Symbol table, CP3: Locals limit, Final: Register allocation
* Daniel Brandão: CP1: Syntactic Analysis, CP2: Semantic analysis, CP3: Stack limit, Final: Constant propagation
* Henrique Santos: CP1: Tree annotations, CP2: Semantic analysis, CP3: Code generation, Final: Register allocation
* Pedro Moás: CP1: Grammar, CP2: Code generation, CP3: More code generation, Final: Extra optimizations

## Pros 

* LL1 grammar
* Thorough semantic analysis
* Robust initialized variable check
* Support for constructors with arguments
* Several optimizations implemented

## Cons 
 
* No Low-level intermediate representation

