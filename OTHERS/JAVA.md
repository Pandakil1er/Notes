# reading and writing input

```java
import java.util.Scanner;

public class Program {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String text = scanner.nextLine();
        int integer = Integer.valueOf(scanner.nextLine());
        double floatingPoint = Double.valueOf(scanner.nextLine());
        boolean trueOrFalse = Boolean.valueOf(scanner.nextLine());

        // and so on
    }
}
```

how to equate strings
```java
Scanner reader = new Scanner(System.in);

System.out.println("Input two strings");
String first = reader.nextLine();
String second = reader.nextLine();

if (first.equals(second)) {
    System.out.println("The strings were the same!");
} else {
    System.out.println("The strings were different!");
}

if (first.equals("two strings")) {
    System.out.println("Clever!");
}

if (second.equals("two strings")) {
    System.out.println("Sneaky!");
    System.out.print("ok");
}
```

Math.sqrt(number)

# ArrayList
```java
ArrayList<String> teachers = new ArrayList<>();

teachers.add("Simon");
teachers.add("Samuel");
teachers.add("Ann");
teachers.add("Anna");

int index = 0;

if (index < teachers.size()) {
    System.out.println(teachers.get(index)); // index = 0
    index = index + 1; // index = 1
}

if (index < teachers.size()) {
    System.out.println(teachers.get(index)); // index = 1
    index = index + 1; // index = 2
}

if (index < teachers.size()) {
    System.out.println(teachers.get(index)); // index = 2
    index = index + 1; // index = 3
}

if (index < teachers.size()) {
    System.out.println(teachers.get(index)); // index = 3
    index = index + 1; // index = 4
}

if (index < teachers.size()) {
    // this will not be executed since index = 4 and teachers.size() = 4
    System.out.println(teachers.get(index));
    index = index + 1;
}
```

for each loop
```
import java.util.ArrayList;

public class RepeatStatement {
    public static void main(String[] args) {
        ArrayList<String> teachers = new ArrayList<>();

        teachers.add("Simon");
        teachers.add("Samuel");
        teachers.add("Ann");
        teachers.add("Anna");

        for (String teacher: teachers) {
            System.out.println(teacher);
        }
    }
}
```



list.remove(1);

list.remove("money")

If the list contains integers, you cannot remove a number value by giving an `int` type parameter to the remove method. This would remove the number from the index that the parameter indicates, instead of an element on the list that has the same value as the parameter. To remove an integer type value you can convert the parameter to Integer type; this is achieved by the `valueOf` method of the Integer class.

```java
list.add(15);
list.add(18);
list.add(21);
list.add(24);

list.remove(2);
list.remove(Integer.valueOf(15));

System.out.println("Index 0 so the first value: " + list.get(0));
System.out.println("Index 1 so the second value: " + list.get(1));
```


list.contain
```java
ArrayList<String> list = new ArrayList<>();

list.add("First");
list.add("Second");
list.add("Third");

System.out.println("Is the first found? " + list.contains("First"));

boolean found = list.contains("Second");
if (found) {
    System.out.println("Second was found");
}

// or more simply
if (list.contains("Second")) {
    System.out.println("Second can still be found");
}
```



arraylist as method parameter
```java
public static void print(ArrayList<String> list) {
    for (String value: list) {
        System.out.println(value);
    }
}
```

```java
ArrayList<String> strings = new ArrayList<>();

strings.add("First");
strings.add("Second");
strings.add("Third");

print(strings);
```

# ArrayList Summary
```java
ArrayList<String> exercises1 = new ArrayList<>();
ArrayList<String> exercises2 = new ArrayList<>();

exercises1.add("Ada Lovelace");
exercises1.add("Hello World! (Ja Mualima!)");
exercises1.add("Six");

exercises2.add("Adding a positive number");
exercises2.add("Employee's pension insurance");

System.out.println("The size of list 1: " + exercises1.size());
System.out.println("The size of list 2: " + exercises2.size());

System.out.println("The first value of the first list " + exercises1.get(0));
System.out.println("The last value of the second list " + exercises2.get(exercises2.size() - 1));
```

```java
ArrayList<String> list = new ArrayList<>();
list.add("hello world!");
```

```java
ArrayList<String> list = new ArrayList<>();
int size = list.size();
System.out.println(size);
```

```java
ArrayList<String> list = new ArrayList<>();
list.add("hello world!");
String string = list.get(0);
System.out.println(string);
```

```java
ArrayList<String> list = new ArrayList<>();
// remove the string "hello world!"
list.remove("hello world!");
 // remove the value at index 3
list.remove(3);
```

```java
ArrayList<String> list = new ArrayList<>();
boolean found = list.contains("hello world!");
```

arraylist is passed a reference to method


# Array

```java
Scanner reader = new Scanner(System.in);

int[] numbers = new int[5];
numbers[0] = 42;
numbers[1] = 13;
numbers[2] = 12;
numbers[3] = 7;
numbers[4] = 1;

System.out.println("Which index should we access? ");
int index = Integer.valueOf(reader.nextLine());

System.out.println(numbers[index]);
```

numbers.length {numbers.length() does not work}
```java
int[] numbers = new int[4];
numbers[0] = 42;
numbers[1] = 13;
numbers[2] = 12;
numbers[3] = 7;

System.out.println("The array has " + numbers.length + " elements.");

int index = 0;
while (index < numbers.length) {
    System.out.println(numbers[index]);
    index = index + 1;
}
```

array as parameter
```java
public static void listElements(int[] integerArray) {
    System.out.println("the elements of the array are: ");
    int index = 0;
    while (index < integerArray.length) {
        int number = integerArray[index];
        System.out.print(number + " ");
        index = index + 1;
    }

    System.out.println("");
}
```

```java
int[] numbers = new int[3];
numbers[0] = 1;
numbers[1] = 2;
numbers[2] = 3;

listElements(numbers);
```

short way to create an array

```java
String[] arrayOfStrings = {"Matti L.", "Matti P.", "Matti V."};
double[] arrayOfFloatingpoints = {1.20, 3.14, 100.0, 0.6666666667};

for (int i = 0; i < arrayOfStrings.length; i++) {
    System.out.println(arrayOfStrings[i] + " " +  arrayOfFloatingpoints[i]);
}
```


# Strings
When comparing strings, you should make sure the string variable has some value assigned to it. If it doesn't have a value, the program will produce a _NullPointerException_ error, which means that no value has been assigned to the variable, or that it is empty (_null_).

```java
System.out.println("Make sure the text is not 'cake'");
String text = "pie";

if (!(text.equals("cake"))) {  // true if the condition text.equals("cake") is false
    System.out.println("it wasn't!");
} else {
    System.out.println("it was!");
}
```

Splitting a String
```java
String text = "first second third fourth";
String[] pieces = text.split(" ");
System.out.println(pieces[0]);
System.out.println(pieces[1]);
System.out.println(pieces[2]);
System.out.println(pieces[3]);

System.out.println();

for (int i = 0; i < pieces.length; i++) {
    System.out.println(pieces[i]);
}
```

String have a contains Method
```java
String text = "volcanologist";

if (text.contains("can")) {
    System.out.println("can was found");
}

if (!text.contains("tin")) {
    System.out.println("tin wasn't found");
}
```

Splitting strings is used particularly when the data is of a fixed format. This refers to data that adheres to some predefined format. An example of this of this is the comma-separated values (`csv`) format

```java
Scanner reader = new Scanner(System.in);

while (true) {
    String input = reader.nextLine();
    if (input.equals("")) {
        break;
    }

    String[] pieces = input.split(",");
    System.out.println("Name: " + pieces[0] + ", age: " + pieces[1]);
}
```

```java
Scanner reader = new Scanner(System.in);
int sum = 0;
int count = 0;

while (true) {
    String input = reader.nextLine();
    if (input.equals("")) {
        break;
    }

    String[] parts = input.split(",");
    sum = sum + Integer.valueOf(parts[1]);
    count = count + 1;
}

if (count > 0) {
    System.out.println("Age average: " + (1.0 * sum / count));
} else {
    System.out.println("No input.");
}
```


text.charAt
```java
String text = "Hello world!";
char character = text.charAt(0);
System.out.println(character);
```

length of string
```java
String word = "equisterian";
int length = word.length();
System.out.println("The length of the word" + word + " is " + length);
```

# Intro to OOP
```java
public class Person {
    private String name;
    private int age;

    public Person(String initialName) {
        this.age = 0;
        this.name = initialName;
    }

    public void printPerson() {
        System.out.println(this.name + ", age " + this.age + " years");
    }
}
```


```java
public class Person {
    // ...

    public String toString() {
        return this.name + ", age " + this.age + " years";
    }
}
```

```java
public static void main(String[] args) {
    Person pekka = new Person("Pekka");
    Person antti = new Person("Antti");

    int i = 0;
    while (i < 30) {
        pekka.growOlder();
        i = i + 1;
    }

    antti.growOlder();

    System.out.println(antti); // same as System.out.println(antti.toString());
    System.out.println(pekka); // same as System.out.println(pekka.toString());
}
```



add object to list
```java
ArrayList<Person> persons = new ArrayList<>();

// a person object can be created first
Person john = new Person("John");
// and then added to the list
persons.add(john);

// person objects can also be created "in the same sentence" that they are added to the list
persons.add(new Person("Matthew"));
persons.add(new Person("Martin"));

for (Person person: persons) {
    System.out.println(person);
}
```

# Files
```java
// first
import java.util.Scanner;
import java.nio.file.Paths;

// in the program:

// we create a scanner for reading the file
try (Scanner scanner = new Scanner(Paths.get("file.txt"))) {

    // we read the file until all lines have been read
    while (scanner.hasNextLine()) {
        // we read one line
        String row = scanner.nextLine();
        // we print the line that we read
        System.out.println(row);
    }
} catch (Exception e) {
    System.out.println("Error: " + e.getMessage());
}
```

string.isEmpty()
