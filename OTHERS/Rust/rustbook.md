# Ch-1
```rust
fn main() {
    println!("Hello, world!");
}
```

Second, `println!` calls a Rust macro. If it had called a function instead, it would be entered as `println` (without the `!`). We’ll discuss Rust macros in more detail in Chapter 19. For now, you just need to know that using a `!` means that you’re calling a macro instead of a normal function and that macros don’t always follow the same rules as functions.

cargo new hello_cargo
- We can create a project using `cargo new`.
- We can build a project using `cargo build`.
- We can build and run a project in one step using `cargo run`.
- We can build a project without producing a binary to check for errors using `cargo check`.
- Instead of saving the result of the build in the same directory as our code, Cargo stores it in the _target/debug_ directory.

cargo build --release

cargo --help

# Ch-2
Chapter 2 of "The Rust Programming Language" book covers the basic concepts of Rust programming, including variables, data types, functions, comments, and control flow. Here are detailed notes on Chapter 2:

### Variables and Mutability:
- **Variable Declaration:** Variables are declared using the `let` keyword followed by the variable name. By default, variables are immutable in Rust.
  ```rust
  let x = 5;
  ```
- **Mutability:** You can make a variable mutable by adding the `mut` keyword before the variable name.
  ```rust
  let mut y = 5;
  y = 6; // valid because y is mutable
  ```

### Data Types:
- **Scalar Types:** Represent a single value. Includes integers, floating-point numbers, booleans, and characters.
- i8-i128 & u8-u128
- **Compound Types:** Compose multiple values into one type. Includes tuples and arrays.
  - **Tuples:** Fixed-size collection of values of different types.
    ```rust
    let tup: (i32, f64, u8) = (500, 6.4, 1);
    let (x, y, z) = tup; // tuple destructuring
    let five_hundred = tup.0; // accessing elements by index
    ```
  - **Arrays:** Fixed-size collection of values of the same type.
    ```rust
    let a: [i32; 5] = [1, 2, 3, 4, 5];
    let first = a[0];
    ```

### Functions:
- **Function Declaration:** Functions are declared using the `fn` keyword followed by the function name.
  ```rust
  fn main() {
      println!("Hello, world!");
  }
  ```
- **Parameters:** Parameters are declared within parentheses after the function name.
  ```rust
  fn add(x: i32, y: i32) -> i32 {
      x + y // implicit return
  }
  ```
- **Return Values:** The return type of a function is specified after an arrow `->`.
- **Statements and Expressions:** Rust is an expression-based language. Statements are instructions that perform some action and do not return a value. Expressions evaluate to a resulting value.
  ```rust
  let x = 5; // statement
  let y = {
      let x = 3;
      x + 1 // expression
  };
  ```

### Comments:
- **Single-line Comments:** Denoted by `//`.
  ```rust
  // This is a single-line comment
  ```
- **Multi-line Comments:** Enclosed within `/* */`.
  ```rust
  /*
  This is a
  multi-line comment
  */
  ```

### Control Flow:
- **if Expression:**
  ```rust
  let number = 6;
  if number % 2 == 0 {
      println!("even");
  } else {
      println!("odd");
  }
  ```
- **Loop:**
  ```rust
  loop {
      println!("again!");
      break;
  }
  ```
- **while Loop:**
  ```rust
  let mut counter = 0;
  while counter < 3 {
      println!("counter: {}", counter);
      counter += 1;
  }
  ```
- **for Loop:**
  ```rust
  let a = [10, 20, 30, 40, 50];
  for element in a.iter() {
      println!("The value is: {}", element);
  }
  ```

These are the key concepts covered in Chapter 2 of "The Rust Programming Language" book, providing a solid foundation for understanding Rust programming fundamentals.


const is used for const in rust 


# Ch-3
Below are detailed notes on Chapter 3 of "The Rust Programming Language" book, including code examples:

### Ownership:

- **Ownership Rules:**
  - Each value in Rust has a variable that's called its owner.
  - There can only be one owner at a time.
  - When the owner goes out of scope, the value will be dropped.

- **Stack and Heap:**
  - Stack: Stores data in a last-in, first-out (LIFO) order, and is fast and limited in size.
  - Heap: Allocates memory at runtime, allows dynamic size, and is slower than the stack.

- **Ownership Transfer:**
  - Ownership of a value is transferred when assigning it to another variable or passing it to a function.
  - The original variable becomes invalid once ownership is transferred.

- **Ownership and Functions:**
  - Passing a value to a function moves its ownership unless it's borrowed using references.

```rust
fn main() {
    let s1 = String::from("hello");
    let s2 = s1; // Ownership of s1 is moved to s2
    // println!("{}", s1); // This will result in a compilation error because s1 is invalid
    println!("{}", s2); // This is valid
}
```

### References and Borrowing:

- **References:**
  - Allow you to refer to some value without taking ownership of it.
  - Created using the `&` symbol followed by the variable name.
  - Immutable references (`&T`) and mutable references (`&mut T`) are distinguished.

- **Mutable References:**
  - Allow changing the data they point to but have restrictions to prevent data races.
  - Only one mutable reference to a particular piece of data in a particular scope is allowed.

```rust
fn main() {
    let mut s = String::from("hello");
    change(&mut s); // Pass a mutable reference to the function
    println!("{}", s); // Prints "world"
}

fn change(some_string: &mut String) {
    some_string.push_str(", world");
}
```

- **Dangling References:**
  - References must always point to valid data.
  - Rust ensures this by enforcing the borrowing rules at compile time.

```rust
fn main() {
    let reference_to_nothing = dangle();
}

fn dangle() -> &String {
    let s = String::from("hello");
    &s // Trying to return a reference to s, which will be dropped when it goes out of scope
}
```

### Slices:

- **Slice Type:**
  - Represents a reference to a contiguous sequence of elements in a collection.
  - Written as `[starting_index..ending_index]`.
  - Shares ownership with the original collection.
  - Can be used to reference a portion of an array.

```rust
fn main() {
    let s = String::from("hello world");
    let hello = &s[0..5];
    let world = &s[6..11];
    println!("{} {}", hello, world); // Prints "hello world"
}
```

- **String Slices:**
  - A slice of a string (`&str`) is a reference to part of a string.
  - `String` literals are slices (`&str`).

- **Array Slices:**
  - Slices can also be used with arrays.
  - They provide a view into the whole array or a subset of the array.

```rust
fn main() {
    let a = [1, 2, 3, 4, 5];
    let slice = &a[1..3]; // Slice containing elements 2 and 3
    println!("{:?}", slice); // Prints "[2, 3]"
}
```

Understanding ownership, borrowing, and slices is crucial for writing safe and efficient Rust code. These concepts help manage memory effectively and prevent common programming errors like data races and memory leaks.

