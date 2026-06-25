---
title: "Design Pattern Snippets"
created: "2026-06-20 13:54:25"
modified: "2026-06-26 04:33:26"
tags: []
draft: false
---

# Strategy Pattern
**Design Principle** : Identify the aspects of your  application that vary and separate  them from what stays the same.  
**Design Principle** : Program to an interface, not an  implementation.

| Relationship       | Concept                                                                    | Keyword Example (Java/C#)       | Real-World Analogy                 |
| ------------------ | -------------------------------------------------------------------------- | ------------------------------- | ---------------------------------- |
| **IS-A**           | **Inheritance**: A specialized version of a base class.                    | `extends`                       | A `Car` **is a** `Vehicle`.        |
| **HAS-A**          | **Composition/Aggregation**: A class contains another class as a field.    | Declaring an instance variable. | A `Car` **has an** `Engine`.       |
| **Implementation** | **Interface fulfillment**: A class promises to provide specific behaviors. | `implements`                    | A `Car` **implements** `Drivable`. |

**Design Principle** : Favor composition over inheritance. 

**The Strategy Pattern** defines a family of algorithms(algorithm means implementation of behaviour),  encapsulates each one, and makes them interchangeable.   Strategy lets the algorithm vary independently from  clients that use it.
![[Pasted image 20260622022022.png]]

# Observer Pattern
