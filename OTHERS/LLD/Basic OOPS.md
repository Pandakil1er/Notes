---
title: "Basic OOPS"
created: "2026-06-27 01:10:41"
modified: "2026-06-27 01:19:24"
tags: []
draft: false
---

# 1. What is OOP?

Object-Oriented Programming is a programming paradigm that models software as **objects**.

An object has:

- State (data)
    
- Behavior (methods)
    

Example

```
Car

State
------
Brand = BMW
Speed = 120

Behavior
---------
start()
stop()
accelerate()
```

Instead of functions manipulating data, **objects own both data and behavior**.

---

# 2. Class

A class is a blueprint.

```
class Car {

}
```

Think:

```
Blueprint
↓

Creates

↓

Objects
```

A class itself occupies little memory until objects are created.

---

# 3. Object

An object is an instance of a class.

```
Car car = new Car();
```

```
Class

Car

↓

Object

car
```

Each object has its own copy of instance variables.

---

# 4. Attributes (Fields)

Variables inside a class.

```
class Student{

    String name;
    int age;
}
```

Types

- Instance variable
    
- Static variable
    
- Final variable
    

---

# 5. Methods

Functions inside classes.

```
class Car{

    void start(){

    }
}
```

Methods define behavior.

Methods may

- Return values
    
- Accept parameters
    
- Throw exceptions
    

---

# 6. Constructor

Special method used during object creation.

Characteristics

- Same name as class
    
- No return type
    
- Runs automatically
    

Types

### Default Constructor

```
Car(){

}
```

### Parameterized Constructor

```
Car(String name){

}
```

### Copy Constructor (C++)

```
Car(Car other){

}
```

Constructors can be overloaded.

---

# 7. Destructor

Used to destroy objects.

Java

```
Garbage Collector
```

C++

```
~Car(){

}
```

---

# 8. `this`

Refers to current object.

```
class Car{

    String name;

    Car(String name){

        this.name = name;
    }
}
```

Uses

- Resolve ambiguity
    
- Return current object
    
- Pass current object
    
- Constructor chaining
    

---

# 9. `super`

Refers to parent class.

```
super.method();

super();
```

Uses

- Parent constructor
    
- Parent method
    
- Parent variable
    

---

# 10. Access Modifiers

|Modifier|Same Class|Package|Child|Outside|
|---|---|---|---|---|
|public|✓|✓|✓|✓|
|protected|✓|✓|✓|✗|
|default|✓|✓|✗|✗|
|private|✓|✗|✗|✗|

---

# 11. Packages / Namespaces

Organize code.

```
com.company.payment

com.company.auth
```

Benefits

- Avoid name conflicts
    
- Better organization
    
- Modular code
    

---

# 12. Encapsulation

Wrapping data and methods together while hiding internal state.

Bad

```
balance = 100000;
```

Good

```
deposit()

withdraw()
```

Advantages

- Data security
    
- Validation
    
- Easier maintenance
    

---

# 13. Abstraction

Hide implementation details.

```
car.start();
```

User doesn't know

- fuel injection
    
- ignition
    
- piston movement
    

Only exposed operation.

Achieved using

- Interfaces
    
- Abstract classes
    

---

# 14. Inheritance

Acquire properties from another class.

```
Animal

↓

Dog
```

Dog gets

- variables
    
- methods
    

Advantages

- Code reuse
    
- Hierarchical modeling
    

---

# 15. Types of Inheritance

### Single

```
A

↓

B
```

---

### Multilevel

```
A

↓

B

↓

C
```

---

### Hierarchical

```
     A
   / | \
  B  C  D
```

---

### Multiple

```
A      B

 \    /

   C
```

Supported in C++

Not directly in Java (interfaces instead)

---

### Hybrid

Combination of multiple types.

---

# 16. Polymorphism

One interface.

Multiple implementations.

```
Animal a = new Dog();

a.speak();
```

Output

```
Bark
```

Main types

- Compile-time
    
- Runtime
    

---

# 17. Compile-Time Polymorphism

Achieved through

Method Overloading

Compiler decides.

---

# 18. Runtime Polymorphism

Achieved through

Method Overriding

Runtime decides.

---

# 19. Method Overloading

Same method

Different parameters

```
sum(int,int)

sum(double,double)

sum(int,int,int)
```

---

# 20. Method Overriding

Child replaces parent's implementation.

```
Animal

↓

Dog
```

Dog overrides

```
speak()
```

---

# 21. Dynamic Dispatch

```
Animal a = new Dog();

a.speak();
```

Compiler

```
Animal
```

Runtime

```
Dog
```

Method executed

```
Dog.speak()
```

Foundation of Strategy, Factory, Observer, State, Command.

---

# 22. Static Binding

Compiler decides.

Examples

- static methods
    
- private methods
    
- overloaded methods
    

---

# 23. Dynamic Binding

Runtime decides.

Examples

- overridden methods
    

---

# 24. Abstract Class

Cannot instantiate.

May contain

- abstract methods
    
- concrete methods
    

Example

```
abstract class Shape{

    abstract draw();

    move(){ }
}
```

---

# 25. Interface

Defines contract.

```
interface Payment{

    pay();
}
```

Implementations

```
CreditCard

UPI

PayPal
```

Supports

- Multiple inheritance
    
- Loose coupling
    

---

# 26. Association

Objects know each other.

```
Teacher

Student
```

Independent lifetimes.

---

# 27. Aggregation

Weak ownership.

```
Department

◇

Teacher
```

Delete Department

Teachers remain.

---

# 28. Composition

Strong ownership.

```
House

◆

Room
```

Delete House

Rooms disappear.

Preferred over inheritance.

---

# 29. Dependency

Temporary relationship.

```
Printer.print(Document doc)
```

Printer depends on Document.

---

# 30. Coupling

Degree of dependency.

High coupling

```
Car

↓

BMWEngine
```

Low coupling

```
Car

↓

Engine Interface
```

Goal

Low coupling.

---

# 31. Cohesion

How focused a class is.

High cohesion

```
Printer

only prints
```

Low cohesion

```
Printer

prints

emails

compresses

encrypts

downloads
```

Goal

High cohesion.

---

# 32. SOLID Principles

### Single Responsibility

One reason to change.

---

### Open Closed

Open for extension.

Closed for modification.

---

### Liskov

Child must replace parent safely.

---

### Interface Segregation

Small focused interfaces.

---

### Dependency Inversion

Depend on abstractions.

Not implementations.

---

# 33. Static Members

Belong to class.

Not object.

```
Math.sqrt()

Student.count
```

One copy shared.

---

# 34. Final Keyword

Used for

Variable

```
constant
```

Method

```
cannot override
```

Class

```
cannot inherit
```

---

# 35. Object Lifecycle

```
Class Loaded

↓

Constructor

↓

Object Created

↓

Methods Called

↓

Object Unreachable

↓

Garbage Collector
```

---

# 36. Shallow Copy

Copies references.

```
A

↓

Object
```

Both share same nested objects.

---

# 37. Deep Copy

Creates entirely new objects.

Everything duplicated.

---

# 38. Copy Constructor

C++

```
Car(Car other)
```

Copies another object.

---

# 39. Cloning

Java

```
clone()
```

Creates duplicate object.

---

# 40. Upcasting

```
Dog

↓

Animal
```

Always safe.

---

# 41. Downcasting

```
Animal

↓

Dog
```

May fail.

---

# 42. instanceof

Checks actual type.

```
obj instanceof Dog
```

Returns

```
true

false
```

---

# 43. Memory Layout

```
Stack

↓

References

↓

Heap

↓

Objects
```

---

# 44. Stack vs Heap

Stack

- Local variables
    
- Function calls
    
- Fast
    

Heap

- Objects
    
- Dynamic allocation
    
- Slower
    

---

# 45. Pass by Value vs Pass by Reference

Java

Everything is pass-by-value, but **object references are passed by value**.

C++

Supports both.

---

# 46. Immutable Objects

Cannot change after creation.

Example

```
String
```

Advantages

- Thread-safe
    
- Cacheable
    
- Secure
    

---

# 47. Nested Classes

Class inside another class.

Types

- Static nested
    
- Inner class
    

---

# 48. Anonymous Classes

Unnamed class.

Used once.

```
new Runnable(){

}
```

---

# 49. Generics (Java) / Templates (C++)

Write reusable code.

```
List<T>

Map<K,V>
```

Avoid casting.

Compile-time type safety.

---

# 50. Exception Handling

```
try

catch

finally

throw

throws
```

Types

Checked

Unchecked

Errors

---

# 51. Reflection (Java)

Inspect classes at runtime.

Can

- Create objects
    
- Call methods
    
- Read private fields
    

Frameworks like Spring and Hibernate use reflection extensively.

---

# 52. Serialization

Convert object

```
Object

↓

Byte Stream

↓

File / Network
```

Deserialize

```
Byte Stream

↓

Object
```

Used in networking, caching, distributed systems.

# Packages (Java)

A **package** is a namespace that groups related classes together.

Think of it like folders on your computer.

```text
com
└── company
    ├── auth
    │   ├── User.java
    │   └── Login.java
    │
    ├── payment
    │   ├── Payment.java
    │   └── Invoice.java
    │
    └── Main.java
```

Example

```java
package com.company.payment;

public class PaymentService {

}
```

Using another package

```java
import com.company.payment.PaymentService;

public class Main {

    public static void main(String[] args) {

        PaymentService service = new PaymentService();
    }
}
```

## Why Packages?

- Organize code
    
- Avoid naming conflicts
    
- Control visibility
    
- Modular development
    
- Easier maintenance
    

---

# Import

Allows one class to use another.

```java
import java.util.ArrayList;
```

Import everything

```java
import java.util.*;
```

Static import

```java
import static java.lang.Math.*;

System.out.println(sqrt(16));
```

---

# Access Modifiers

Access modifiers determine who can access classes, methods, constructors, and variables.

There are four access modifiers in Java.

---

## public

Accessible from anywhere.

```java
public class Student {

    public String name;

    public void study() {

    }
}
```

Can be accessed by every package.

```text
Same Class      Yes
Same Package    Yes
Subclass        Yes
Other Packages  Yes
```

---

## private

Accessible only inside the same class.

```java
class BankAccount {

    private int balance;
}
```

```text
Same Class      Yes
Same Package    No
Child Class     No
Outside         No
```

Usually used for encapsulation.

Example

```java
class Account {

    private double balance;

    public void deposit(double amount) {
        balance += amount;
    }

    public double getBalance() {
        return balance;
    }
}
```

Users cannot directly modify

```java
account.balance = -1000;
```

---

## protected

Accessible

- Same package
    
- Child classes
    

```java
class Animal {

    protected void eat() {

    }
}
```

```text
Same Class      Yes
Same Package    Yes
Child Class     Yes
Other Packages  No*
```

_Accessible in another package only through inheritance._

Example

```java
class Dog extends Animal {

    void run() {
        eat();
    }
}
```

---

## Default (Package-Private)

If no modifier is written.

```java
class Student {

    void study() {

    }
}
```

```text
Same Class      Yes
Same Package    Yes
Child Class     No
Outside         No
```

Very common for helper classes.

---

# Access Modifier Summary

|Modifier|Same Class|Same Package|Subclass|Other Package|
|---|:-:|:-:|:-:|:-:|
|`public`|Yes|Yes|Yes|Yes|
|`protected`|Yes|Yes|Yes|No*|
|_(Accessible in other packages only through inheritance.)_|||||
|_(package-private)_|Yes|Yes|No|No|
|`private`|Yes|No|No|No|

---

# Classes and Access Modifiers

Top-level classes can only be

```java
public class A {

}
```

or

```java
class A {

}
```

They cannot be

```java
private class A      // Invalid
protected class A    // Invalid
```

(Inner classes can use all access modifiers.)

---

# Getters and Setters

Because fields are usually private.

```java
class Student {

    private int age;

    public int getAge() {
        return age;
    }

    public void setAge(int age) {

        if (age >= 0)
            this.age = age;
    }
}
```

Benefits

- Validation
    
- Read-only properties
    
- Write-only properties
    
- Encapsulation
    

---

# Information Hiding

Bad

```java
class User {

    public String password;
}
```

Anyone can do

```java
user.password = "123";
```

Good

```java
class User {

    private String password;

    public void setPassword(String password) {

        if(password.length() >= 8)
            this.password = password;
    }
}
```

Now invalid passwords cannot be assigned.

---

# Package vs Folder

A package is not exactly a folder, but in Java the folder structure typically mirrors the package name.

```text
Package

com.company.auth

↓

Folder Structure

com/
   company/
      auth/
```

The package declaration should match the directory structure.

---

# Common Java Packages

|Package|Purpose|
|---|---|
|`java.lang`|Core classes (`String`, `Math`, `Object`, `System`)|
|`java.util`|Collections, `ArrayList`, `HashMap`, `Scanner`|
|`java.io`|File and stream I/O|
|`java.nio`|Modern file and buffer APIs|
|`java.net`|Networking|
|`java.time`|Date and time API|
|`java.sql`|Database connectivity (JDBC)|
|`java.util.concurrent`|Multithreading and concurrency utilities|

---

# Encapsulation + Access Modifiers

```text
                  Encapsulation
                        │
        ┌───────────────┴───────────────┐
        │                               │
   private fields                 public methods
        │                               │
 Hide internal data          Controlled access
```

A common Java pattern is:

```java
public class Employee {

    private String name;
    private double salary;

    public Employee(String name, double salary) {
        this.name = name;
        this.salary = salary;
    }

    public String getName() {
        return name;
    }

    public double getSalary() {
        return salary;
    }

    public void increaseSalary(double amount) {
        if (amount > 0) {
            salary += amount;
        }
    }
}
```

This combines packages, access modifiers, constructors, and encapsulation, which are core building blocks you'll see repeatedly in design patterns, Spring, and large Java applications.