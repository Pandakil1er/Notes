# M1
****

static keyword - https://www.baeldung.com/java-static#:~:text=In%20the%20Java%20programming%20language,all%20instances%20of%20the%20class.

read L1 pdf![[M1_L1.pdf]]
****

**L2**
read theory
abstarct keyword
```
abstract class GraphicObject {
    int x, y;
    ...
    void moveTo(int newX, int newY) {
        ...
    }
    abstract void draw();
    abstract void resize();
}

Each nonabstract subclass of `GraphicObject`, such as `Circle` and `Rectangle`, must provide implementations for the `draw` and `resize` methods:

class Circle extends GraphicObject {
    void draw() {
        ...
    }
    void resize() {
        ...
    }
}
class Rectangle extends GraphicObject {
    void draw() {
        ...
    }
    void resize() {
        ...
    }
}

```

inheritance
```
public class Bicycle {
        
    // **the Bicycle class has three _fields_**
    public int cadence;
    public int gear;
    public int speed;
        
    // **the Bicycle class has one _constructor_**
    public Bicycle(int startCadence, int startSpeed, int startGear) {
        gear = startGear;
        cadence = startCadence;
        speed = startSpeed;
    }
        
    // **the Bicycle class has four _methods_**
    public void setCadence(int newValue) {
        cadence = newValue;
    }
        
    public void setGear(int newValue) {
        gear = newValue;
    }
        
    public void applyBrake(int decrement) {
        speed -= decrement;
    }
        
    public void speedUp(int increment) {
        speed += increment;
    }
        
}

A class declaration for a `MountainBike` class that is a subclass of `Bicycle` might look like this:

public class MountainBike extends Bicycle {
        
    // **the MountainBike subclass adds one _field_**
    public int seatHeight;

    // **the MountainBike subclass has one _constructor_**
    public MountainBike(int startHeight,
                        int startCadence,
                        int startSpeed,
                        int startGear) {
        super(startCadence, startSpeed, startGear);
        seatHeight = startHeight;
    }   
        
    // **the MountainBike subclass adds one _method_**
    public void setHeight(int newValue) {
        seatHeight = newValue;
    }   
}

```
polymorphism
- method overloading
- ```class PolymDemo {
	public void print(String s){
		System.out.println("First Method with only String- "+ s);
	}
	public void print (int i){
		System.out.println("Second Method with only int- "+ i);
	}
	public void print (String s, int i){
		System.out.println("Third Method with both- "+ s + "--" + i);
	}
}

 class OverloadExample {
	public static void main(String[] args) {
		PolymDemo obj = new PolymDemo();
		obj.print(10);
		obj.print("Amit");
		obj.print("Hello", 100);
		System.out.println(10+20+"hi"+ 10 +20);
	}
}
- method overriding 
- ```public class MountainBike extends Bicycle {
    private String suspension;

    public MountainBike(
               int startCadence,
               int startSpeed,
               int startGear,
               String suspensionType){
        super(startCadence,
              startSpeed,
              startGear);
        this.setSuspension(suspensionType);
    }

    public String getSuspension(){
      return this.suspension;
    }

    public void setSuspension(String suspensionType) {
        this.suspension = suspensionType;
    }

    public void printDescription() {
        super.printDescription();
        System.out.println("The " + "MountainBike has a" +
            getSuspension() + " suspension.");
    }
}
```

```

Dynamic Binding
message passing
![[M1_L2.pdf]]
****
**L3**
read pdf
![[M1_L3.pdf]]
****
# M2
****
**L1**
Data Types
- Primitive
![[Screenshot_20230506_010623.png]]

- Non-primitive
1. Classes
2. Interfaces
3. Arrays
****
**L2**
Type Conversion And Casting
- Widening conversion - small to large
- Narrowing conversion - large to small
byte to char
char to byte

- Implicit type conversion - carried by compiler
- explicit type conversion - (int)d

type conversion
1. Java automatically promotes each byte, short, or char operand to int when evaluating an
expression.
2. If one operand is long, float or double the whole expression is promoted to long, float, or
double respectively.

Operator Precedence in java
![[Screenshot_20230506_011819.png]]
![[Screenshot_20230506_011839.png]]
****
**L3**
1. Decison Making statements 
- if else,nested if
- switch
![[Screenshot_20230506_012730.png]]

```java
import java.util.Scanner;

public class SwitchCaseDemo {
    public static void main(String[] args) {
        System.out.println("Enter any number from 1 to 4");
        Scanner sc = new Scanner(System.in);
        int day = sc.nextInt();
        
        switch (day){
            case 1->             
                System.out.println("Monday");
            case 2->              
                System.out.println("Tuesday");
            case 3->              
                System.out.println("Wednesday");
            case 4->               
                System.out.println("Thursday");
            default->             
                System.out.println("no condition satisfied");
        }
    }
}

```

2. Loop Statements
- do while
- while
- for

3. Jump statements
- break
- continue
****
**L4**
- Object
A software object is a bundle of variables (state) and methods (operations).
- Class
A class is a blueprint that defines the variables and methods common to all objects of a certain kind.
An object holds values for the variables defines in the class.
An object is called an instance of the Class

Object Creation - Object obj = new Object();
Object Deletion - Automatic in java

In Java, when an object is no longer accessible through any variable, it is eventually removed from the memory by the garbage collector.
Garbage collector is parts of the class Student2{  
     int rollno;  
     String name;  
     static String college = "IIIT Lucknow";  
     
     //static method to change the value of static variable  
     static void change(){  
        college = "IIT Kharagpur";  
         //String n = "Arjun";
     }  
    Student2(int r, String n){  
        rollno = r;  
        name = n;  
        System.out.println("Constructor");
     }  
     void display(){
         System.out.println(rollno+" "+name+" "+college);
    }  
    {
        System.out.println("block");
    }
} 
 
public class TestStaticMethod{  
    public static void main(String args[]){  
    //Student2.change();//calling change method 
    Student2.college = "IIT KGP";
    Student2 s1 = new Student2(111,"Karan");  
   // Student2 s2 = new Student2(222,"Aryan");  
    //Student2 s3 = new Student2(333,"Sonu");  
    
    s1.display();  
    //s2.display();  
    //s3.display();  
    }  
}  Java Run-Time Environment.


Type of Constructor
1. Default Constructor
2. No-arg Constructor
3. Parameterized Constructor
```java

class DefaultConstructor{
    int id;
    String name;
    public DefaultConstructor(){
        System.out.println("Inside default constructir");
    }
}
class NoArgConstructor{
    int id;
    String name;
    public NoArgConstructor(){
        System.out.println("Invoking No-Argument constructor");
    }
    public void display(){
        System.out.println(id + " " + name);
    }
}
class ParamConstructor{
    int id, age;
    String name;
    public ParamConstructor(int i, String n){
        id = i;
        name = n;
    }
    public ParamConstructor(int i, String n, int a){
        id = i;
        name = n;
        age = a;
    }
    //copy constructor
    public ParamConstructor(ParamConstructor ref){
        System.out.println("Invoking copy constructor");
        id = ref.id;
        name = ref.name;
    }
    public void display(){
        System.out.println(id + " " + name + " " + age);
    }
}    

class ConstructorDemo{
public static void main(String args[]){
    DefaultConstructor d1 = new DefaultConstructor();
    //System.out.println(d1.id + " " + d1.name);

    NoArgConstructor s1 = new NoArgConstructor();
    //s1.display();
    
    ParamConstructor s2 = new ParamConstructor(1,"abc");
    //ParamConstructor s2 = new ParamConstructor(); //Error
    s2.display();

    ParamConstructor s3 = new ParamConstructor(2, "name", 11);//overloading
    s3.display();

    ParamConstructor s4 = new ParamConstructor(s2);//copy constructor
    s4.display();
    s4 = s2;
}
}  


```

![[Screenshot_20230506_014628.png]]
****
**L5**
this keyword uses
1. this can be used to refer current class instance variable.
2. this can be used to invoke current class method (implicitly)
3. this() can be used to invoke current class constructor.
4. this can be passed as an argument in the method call.
5. this can be passed as argument in the constructor call.
6. this can be used to return the current class instance from the method.

****

**L6**

- Inner Class
1. static
2. non - static - nested class

- Modifiers
1. Access Modifier - default,public,private,protected
2. Non-access Modifier - static,abstract,synchronized,native,volatile,transient,etc
![[Screenshot_20230506_034431.png]]




****
**L7**
inheritence - extends keyword
- single
- multilevel
- hierarchichal
- multiple inheritance is not in java
- ![[Screenshot_20230507_152556.png]]
- inheritance in interfaces
- multiple
- hybrid
****
**L8**
super keyword
****
**L9**
static keyword
