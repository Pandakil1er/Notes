---
title: SOLID principle
created: 2026-06-20 13:59:53
modified: "2026-06-26 03:21:10"
tags: []
draft: false
---

Here are comprehensive notes based on Katerina Trajchevska's talk, "Becoming a better developer by using the SOLID design principles."

The core goal of the SOLID principles is to write code that is **easier to maintain, easier to extend, and easier to understand** [[06:09](https://www.youtube.com/watch?v=rtmFCcjEgEw&t=369)]. By investing a bit more time structuring the code upfront, developers spend drastically less time trying to read and untangle it later.

Here is a breakdown of the five principles, along with the speaker's examples:

## 1. Single Responsibility Principle (SRP) [[07:06](https://www.youtube.com/watch?v=rtmFCcjEgEw&t=426)]

**"A class should have one, and only one, reason to change."**

- **The Concept:** Think of SRP like a perfectly organized room where everything has a specific place. Instead of having massive, monolithic classes with generic names (like `Employee`), you should have smaller, highly specific classes (like `EmployeePayroll` or `EmployeeTimeLog`).
    
- **Laravel Example:** A Controller method shouldn't know how to validate inputs or communicate directly with the database structure. Its only job is to direct the flow of data. Move input validation out to custom Form Requests and database logic out to Repositories.
    

## 2. Open/Closed Principle (OCP) [[13:57](https://www.youtube.com/watch?v=rtmFCcjEgEw&t=837)]

**"An entity should be open for extension but closed for modification."**

- **The Concept:** You should be able to add new functionality to a system by writing _new_ code, not by going back and changing _existing_ code. This keeps your core logic stable and bug-free over time.
    
- **The Problem:** Adding endless `if/else` statements inside a `Pay()` method every time you need to support a new payment type (PayPal, Credit Card, Wire Transfer).
    
- **The Solution:** Use the Factory pattern and interfaces. Create a single `Payable` interface. When a new payment method is needed, simply create a new class that implements the interface. The core controller never has to change.
    

## 3. Liskov Substitution Principle (LSP) [[20:43](https://www.youtube.com/watch?v=rtmFCcjEgEw&t=1243)]

**"Derived classes must be substitutable for their base classes."**

- **The Concept:** The client side of your application should get the expected response no matter which specific class instance it receives, provided the class implements the correct interface.
    
- **The "Rubber Duck" Problem:** If you have an abstract `Duck` class with `quack()`, `swim()`, and `fly()` methods, extending it to create a `RubberDuck` violates LSP. Because rubber ducks can't fly, you'd have to override the `fly()` method to throw an exception.
    
- **The Solution:** Code by contract using tailored interfaces (e.g., `Quackable`, `Swimmable`). Only implement the interfaces that truly apply to the object so the program behaves exactly as expected.
    

## 4. Interface Segregation Principle (ISP) [[27:18](https://www.youtube.com/watch?v=rtmFCcjEgEw&t=1638)]

**"No client should be forced to depend on methods it does not use."**

- **The Concept:** Avoid bloated, "fat" interfaces. If an object is forced to depend on a massive class just to use one of its methods, it becomes vulnerable to changes made anywhere within that large class.
    
- **The Solution:** Replace large object dependencies with small, highly specific interfaces. For example, a `Notifications` class shouldn't depend on an entire Eloquent `Subscriber` model just to get an email address. Instead, it should depend on a tiny `Notifiable` interface that only contains the `getNotifyEmail()` method.
    

## 5. Dependency Inversion Principle (DIP) [[31:23](https://www.youtube.com/watch?v=rtmFCcjEgEw&t=1883)]

**"High-level modules should not depend on low-level modules. Both should depend on abstractions."**

- **The Concept:** When you plug a lamp into a wall socket, you are interacting with an abstraction (the socket interface). You don't care how the wires are routed inside the wall (the low-level details).
    
- **The Solution:** High-level code (like Controllers) shouldn't care about what database engine you are using. By depending on a `UserRepositoryInterface` rather than a concrete `UserRepository`, you can swap your entire database backend (e.g., from MySQL to MongoDB) simply by creating a new repository that implements the interface. The high-level code never needs to be touched.
    

## Words of Caution [[37:07](https://www.youtube.com/watch?v=rtmFCcjEgEw&t=2227)]

Katerina wraps up the talk by noting that trying to enforce SOLID blindly can actually ruin a codebase.

- **Beware over-fragmentation:** Forcing Single Responsibility too strictly can result in dozens of tiny classes that make the code impossible to follow.
    
- **Context matters:** If an application is incredibly simple, adding layers of abstractions and repositories is over-engineering. It's perfectly fine to use direct Eloquent models for basic apps.
    
- **The Golden Rule:** SOLID is your _tool_, not your _goal_. Use the principles only when they actively help make the code easier to extend and maintain.


Here is a detailed explanation of each SOLID principle using Java, contrasting a "bad" approach (violating the principle) with a "good" approach (following the principle).

### 1. Single Responsibility Principle (SRP)

**"A class should have one, and only one, reason to change."**

A class should only have one job. If a class has multiple responsibilities, it becomes coupled. A change to one responsibility results in modification of the other responsibility, which can introduce bugs.

**❌ Bad Example:** This `Employee` class manages employee data, handles database operations, and formats reports. It has three reasons to change.

Java

```
public class Employee {
    private String name;
    private double salary;

    public Employee(String name, double salary) {
        this.name = name;
        this.salary = salary;
    }

    // Responsibility 1: Core Data
    public String getName() { return name; }
    public double getSalary() { return salary; }

    // Responsibility 2: Database Operations
    public void saveToDatabase() {
        System.out.println("Saving " + name + " to database...");
    }

    // Responsibility 3: Formatting/Reporting
    public String generateReport() {
        return "Employee Report: " + name + " earns $" + salary;
    }
}
```

**✅ Good Example:** We split the responsibilities into three distinct classes.

Java

```
// 1. Core Data Class
public class Employee {
    private String name;
    private double salary;
    // Constructor, getters, setters
}

// 2. Database Class
public class EmployeeRepository {
    public void save(Employee employee) {
        System.out.println("Saving " + employee.getName() + " to database...");
    }
}

// 3. Reporting Class
public class EmployeeReportGenerator {
    public String generateReport(Employee employee) {
        return "Employee Report: " + employee.getName() + " earns $" + employee.getSalary();
    }
}
```

### 2. Open/Closed Principle (OCP)

**"Software entities should be open for extension, but closed for modification."**

You should be able to add new functionality without changing existing code. This is usually achieved using interfaces or abstract classes.

**❌ Bad Example:** If we want to add a new "Student" discount, we have to modify the existing `DiscountCalculator` class, risking breaking the VIP or Regular logic.

Java

```
public class DiscountCalculator {
    public double calculateDiscount(String customerType, double amount) {
        if (customerType.equals("VIP")) {
            return amount * 0.20;
        } else if (customerType.equals("REGULAR")) {
            return amount * 0.05;
        }
        return 0; // If we add "STUDENT", we must modify this file!
    }
}
```

**✅ Good Example:** We create a `DiscountPolicy` interface. To add a new discount, we just create a _new_ class. The `DiscountCalculator` never needs to be modified again.

Java

```
public interface DiscountPolicy {
    double calculateDiscount(double amount);
}

public class VipDiscount implements DiscountPolicy {
    @Override
    public double calculateDiscount(double amount) { return amount * 0.20; }
}

public class RegularDiscount implements DiscountPolicy {
    @Override
    public double calculateDiscount(double amount) { return amount * 0.05; }
}

// Now the calculator is "Closed for modification" but "Open for extension"
public class DiscountCalculator {
    public double calculate(DiscountPolicy policy, double amount) {
        return policy.calculateDiscount(amount);
    }
}
```

### 3. Liskov Substitution Principle (LSP)

**"Derived classes must be substitutable for their base classes."**

If class A is a subtype of class B, you should be able to replace B with A without ruining the program. A subclass should override parent methods in a way that doesn't break functionality from a client's point of view.

**❌ Bad Example (The classic Rectangle/Square problem):** Mathematically, a Square is a Rectangle. But in code, if a `Square` inherits from `Rectangle`, it breaks expectations. A user of `Rectangle` expects to change width without affecting height.

Java

```
public class Rectangle {
    protected int width, height;
    public void setWidth(int width) { this.width = width; }
    public void setHeight(int height) { this.height = height; }
    public int getArea() { return width * height; }
}

public class Square extends Rectangle {
    // A square must have equal sides, forcing a weird override
    @Override
    public void setWidth(int width) {
        this.width = width;
        this.height = width; // Breaks Rectangle behavior!
    }
    
    @Override
    public void setHeight(int height) {
        this.width = height;
        this.height = height; // Breaks Rectangle behavior!
    }
}
```

_If a method expects a `Rectangle` and gets a `Square`, calling `rect.setWidth(5)` and `rect.setHeight(10)` will result in an area of 100, not 50, breaking the program._

**✅ Good Example:** Don't force inheritance if the behavior isn't fully compatible. Instead, rely on a common abstraction.

Java

```
public interface Shape {
    int getArea();
}

public class Rectangle implements Shape {
    private int width, height;
    // ... constructors and setters ...
    @Override
    public int getArea() { return width * height; }
}

public class Square implements Shape {
    private int sideLength;
    // ... constructors and setters ...
    @Override
    public int getArea() { return sideLength * sideLength; }
}
```

### 4. Interface Segregation Principle (ISP)

**"A client should never be forced to implement an interface that it doesn't use."**

It is better to have many small, specific interfaces rather than one huge, general-purpose interface.

**❌ Bad Example:** We have a massive `Worker` interface. A `Robot` implements it, but robots don't eat. It is forced to leave the method blank or throw an exception.

Java

```
public interface Worker {
    void work();
    void eat();
    void sleep();
}

public class HumanWorker implements Worker {
    public void work() { System.out.println("Working..."); }
    public void eat() { System.out.println("Eating lunch..."); }
    public void sleep() { System.out.println("Sleeping..."); }
}

public class RobotWorker implements Worker {
    public void work() { System.out.println("Processing tasks..."); }
    
    public void eat() {
        throw new UnsupportedOperationException("Robots don't eat!"); // Violation!
    }
    
    public void sleep() {
        throw new UnsupportedOperationException("Robots don't sleep!"); // Violation!
    }
}
```

**✅ Good Example:** Segregate the big interface into smaller, capability-based interfaces.

Java

```
public interface Workable {
    void work();
}

public interface Feedable {
    void eat();
}

public interface Sleepable {
    void sleep();
}

// Human implements what it needs
public class HumanWorker implements Workable, Feedable, Sleepable {
    public void work() { /* ... */ }
    public void eat() { /* ... */ }
    public void sleep() { /* ... */ }
}

// Robot only implements what it actually does
public class RobotWorker implements Workable {
    public void work() { System.out.println("Processing tasks..."); }
}
```

### 5. Dependency Inversion Principle (DIP)

**"High-level modules should not depend on low-level modules. Both should depend on abstractions."**

Your main logic (high-level) shouldn't be tightly coupled to specific details (low-level, like a specific database or a specific API). Instead, they should communicate through interfaces.

**❌ Bad Example:** A `LightSwitch` (high level) directly instantiates a specific `LightBulb` (low level). If you want the switch to control a fan later, you have to rewrite the `LightSwitch` class.

Java

```
// Low-level module
public class LightBulb {
    public void turnOn() { System.out.println("LightBulb: Bulb turned on..."); }
    public void turnOff() { System.out.println("LightBulb: Bulb turned off..."); }
}

// High-level module
public class LightSwitch {
    private LightBulb bulb; // Tightly coupled to a specific class!

    public LightSwitch() {
        this.bulb = new LightBulb();
    }

    public void operate(boolean isOn) {
        if (isOn) bulb.turnOn();
        else bulb.turnOff();
    }
}
```

**✅ Good Example:** We introduce a `Switchable` interface. The `LightSwitch` doesn't care _what_ it is turning on, as long as the object implements `Switchable`.

Java

```
// Abstraction
public interface Switchable {
    void turnOn();
    void turnOff();
}

// Low-level module 1
public class LightBulb implements Switchable {
    public void turnOn() { System.out.println("Light ON"); }
    public void turnOff() { System.out.println("Light OFF"); }
}

// Low-level module 2 (Easily added later!)
public class Fan implements Switchable {
    public void turnOn() { System.out.println("Fan spinning"); }
    public void turnOff() { System.out.println("Fan stopped"); }
}

// High-level module
public class LightSwitch {
    private Switchable device; // Depends on abstraction!

    // Dependency is injected via constructor
    public LightSwitch(Switchable device) {
        this.device = device;
    }

    public void operate(boolean isOn) {
        if (isOn) device.turnOn();
        else device.turnOff();
    }
}
```
