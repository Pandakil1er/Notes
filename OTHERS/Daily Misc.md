---
title: "Daily Misc"
created: 2026-06-26 02:55:21
modified: "2026-07-10 23:51:33"
tags: []
draft: false
---


# 26 June
```
set -euo pipefail
```

Enables strict mode:

- `-e`: exit immediately if any command fails.
- `-u`: error if an undefined variable is used.
- `pipefail`: if any command in a pipeline fails, the whole pipeline fails.

Without this, scripts can silently continue after errors.

### What does `${...}` do?

`${}` is just the full syntax for expanding variables.

These are equivalent:

```
$1
${1}
```

But `${}` becomes necessary when using modifiers like `:-`.

---

### Step 3: What does `:-` mean?

Syntax:

```
${variable:-default}
```

Meaning:

> If `variable` is unset or empty, use `default`.

Example:

```
name="Anshaj"echo "${name:-Unknown}"
```

Output:

```
Anshaj
```


```
git clean -f -d
```

# July 1
## Monoids For Parallel Computation
> From: https://gemini.google.com/app/eef8c691125ee5f5

### you asked

message time: 2026-06-26 08:57:53

Https://okmij.org/ftp/Algorithms/map-monoid-reduce.html

can you explain this to me , I am A CS engineer.

---

### gemini response

This article, written by Oleg Kiselyov, builds heavily on a famous 2009 ICFP keynote by Guy Steele titled *"foldl and foldr considered slightly harmful."* As a CS engineer, the main takeaway is a shift in how we write loops and accumulate state: **traditional sequential loops (folds) are performance bottlenecks in modern multi-core/distributed computing. By reframing algorithms around mathematical "monoids," we can achieve "embarrassingly parallel," lock-free code.**

Here is a breakdown of the core concepts and algorithms discussed:

##### 1. The Problem: Folds are Inherently Sequential
In functional programming, `fold_left` and `fold_right` are the standard ways to accumulate state over a sequence (equivalent to a `for` loop in imperative programming). 
The problem is data dependency. Evaluating `fold_left (+) 0 [1;2;3;4]` evaluates as `(((0 + 1) + 2) + 3) + 4`. Each step strictly requires the accumulator from the previous step, making it impossible to split the work across multiple threads without synchronization overhead. 
##### 2. The Solution: Monoids and `Reduce`
A **monoid** is an algebraic structure consisting of:
1.  A set of values (a "carrier set" type).
2.  An **associative** binary operation (e.g., `(a + b) + c == a + (b + c)`).
3.  An identity/zero element (e.g., `a + 0 == a`).

Because a monoid's operation is associative, we do not need strict left-to-right evaluation. A `reduce` operation over a monoid allows us to group operations arbitrarily: `(1 + 2) + (3 + 4)`. This unlocks **divide-and-conquer parallelization**. We can split a massive array into chunks, hand them to different CPU cores or distributed nodes (like in Google MapReduce), evaluate them independently without locks or race conditions, and then merge the results. 
##### 3. The Conjugate Transform (Map-Reduce)
Not all algorithms seem to have associative properties (for example, finding the length of a list, or subtraction). To solve this, the article discusses the **Conjugate Transform**. 

This is a design pattern where you:
1.  **Map** your raw data into a "bigger" data type that *does* form a valid monoid.
2.  **Reduce** that monoid in parallel.
3.  Transform the final reduced state into your desired output.

##### 4. Parallelizing "Inherently Sequential" Algorithms
The most technically impressive part of the article is proving that algorithms traditionally taught as strictly sequential can be parallelized by designing clever monoids:

* **Generalized Horner's Rule:** Horner's method evaluates polynomials efficiently (e.g., $ax^3 + bx^2 + cx + d$) by factoring them into nested additions and multiplications. By framing the operations as matrix multiplications (which are associative), Kiselyov shows how it can be evaluated in parallel.
* **Boyer-Moore Majority Vote Algorithm:** This famous $O(N)$ time, $O(1)$ space algorithm finds the majority element in an array by keeping a running tally of a "candidate" element. Because it relies on the current running state, it looks completely sequential. The author constructs a custom pair data structure (count, candidate) and designs a combining operation that acts as a "moral" monoid, allowing the majority vote to be executed in parallel chunks.

##### 5. Vertical Monoid Composition (Data Analytics)
Towards the end, Kiselyov introduces a way to combine multiple monoids "vertically." If you are writing data processing pipelines (similar to complex SQL `GROUP BY` and aggregations), you usually have to do multiple passes over the data. 

By mathematically composing smaller monoids into larger, observable monoids, you can perform highly nested grouping and aggregation on raw, massive datasets in **a single, race-free parallel pass**. 

##### Summary for your day-to-day engineering:
If you are processing big data, try to avoid stateful `for` loops. Instead, ask yourself: *"Can I map my data into a structure where my combining operation is associative?"* If you can find the underlying **monoid**, the parallel execution and scaling can be handled automatically by the system infrastructure without you ever having to write a mutex or a thread lock.

---

### you asked

message time: 2026-06-26 09:00:54

I still don't understand the math

---

### gemini response

Let's break down the core mathematics of the article. If you think about the data structures used heavily in competitive programming—specifically Segment Trees—you are actually already applying this exact math. A Segment Tree is essentially a physical manifestation of a mathematical **Monoid**.

Here is the exact math Kiselyov is utilizing to turn sequential loops into parallel, distributed operations.

##### 1. The Math of a Monoid
In abstract algebra, a **Monoid** is defined by three strict rules. You need a Set of values (let's call it $S$) and a binary operation (let's denote it as $\oplus$). 

To be a Monoid, the following must be true:
1.  **Closure:** If $a$ and $b$ are in $S$, then $a \oplus b$ is also in $S$. (e.g., adding two integers results in an integer).
2.  **Associativity (The Golden Rule for Parallelism):** $(a \oplus b) \oplus c = a \oplus (b \oplus c)$.
3.  **Identity Element:** There exists an element $e$ such that $a \oplus e = e \oplus a = a$. (e.g., $0$ for addition, $1$ for multiplication).

**Notice what is missing:** Commutativity ($a \oplus b = b \oplus a$) is **not** required. 

**Why does this math matter to a system's architecture?**
Because of rule ###2 (Associativity), the order in which we evaluate the operations doesn't matter, as long as the relative sequence is maintained. 

If you are folding an array sequentially, the math looks like this:
$((((a \oplus b) \oplus c) \oplus d) \oplus e)$ -> *This is `fold_left`. It takes $O(N)$ time and cannot be split across threads.* 

If your operation is a Monoid, you can rewrite the exact same equation as:
$((a \oplus b) \oplus c) \oplus (d \oplus e)$ -> *This is `reduce`. Thread 1 computes $(a \oplus b \oplus c)$, Thread 2 computes $(d \oplus e)$ concurrently. You just merge the results.* 

In competitive programming, you can build a Segment Tree to query the `min`, `max`, `sum`, or `gcd` of an array range because all of those operations are associative (they are Monoids). You *cannot* easily build a standard Segment Tree for subtraction, because $(10 - 5) - 2 \neq 10 - (5 - 2)$. 

##### 2. The Math of the "Conjugate Transform"
The hardest math in the paper deals with algorithms that are *not* Monoids. How do you parallelize them? You use a Conjugate Transform to map your data into a higher-dimensional space that *is* a Monoid.

Let's take a simple non-associative mathematical operation: **Average**.
$Avg(Avg(1, 3), 5) = Avg(2, 5) = 3.5$
$Avg(1, Avg(3, 5)) = Avg(1, 4) = 2.5$
Because $3.5 \neq 2.5$, Average is not a Monoid. You cannot split an array into chunks, average the chunks, and then average the averages (unless the chunks are exactly the same size).

**The Conjugate Transform Math:**
Instead of operating on the integers directly, we map each element $x$ into a tuple containing the sum and the count: $f(x) \to (x, 1)$.

Now, we define a new operation $\oplus$ for our tuples:
$(S_1, C_1) \oplus (S_2, C_2) = (S_1 + S_2, C_1 + C_2)$

Is this new operation associative? Yes! Addition is associative. We have just created a valid Monoid.
Now, in a low-level backend, you can safely distribute these tuples across 1000 different nodes. They will reduce them in parallel into a single final tuple: $(S_{final}, C_{final})$. 

To get the final answer, you apply the exit function: $S_{final} / C_{final}$.

##### 3. The Math of Horner's Rule (Matrix Monoids)
Kiselyov shows how to apply this to Generalized Horner's Rule. Horner's method evaluates a polynomial $P(x) = ax^3 + bx^2 + cx + d$ efficiently by nesting it:
$P(x) = d + x(c + x(b + x(a)))$

This looks strictly sequential. You must compute the inner parenthesis before the outer one. 
However, Kiselyov uses math to map this into **Matrices**. 

A linear transformation like $y_{new} = x \cdot y_{old} + c$ can be written as a matrix-vector multiplication:
$$\begin{bmatrix} y_{new} \\ 1 \end{bmatrix} = \begin{bmatrix} x & c \\ 0 & 1 \end{bmatrix} \begin{bmatrix} y_{old} \\ 1 \end{bmatrix}$$

Each step in Horner's sequential loop can be represented by a $2 \times 2$ matrix. 
Here is the mathematical punchline: **Matrix multiplication is associative.** $(A \times B) \times C = A \times (B \times C)$. 

Therefore, matrices form a Monoid! By transforming the sequential polynomial steps into a list of matrices, you can multiply those matrices together in a massive parallel binary tree using divide-and-conquer, completely eliminating the sequential bottleneck.

---

### you asked

message time: 2026-06-26 09:04:31

Conjugate transform on avg problem, and what is fold

---

### gemini response

Here is a breakdown of both concepts. Let's start with `fold` since understanding it makes the Conjugate Transform much clearer.

##### What is a Fold?

In computer science, a **fold** (often called `reduce`, `accumulate`, or `inject`) is a standard higher-order function that processes a data structure—usually a list or array—in a specific order and builds up a single return value. 

At its core, a fold is the functional programming equivalent of a stateful `for` loop. It takes three things:
1.  **An array/list** of data.
2.  **An initial accumulator value** (the starting state).
3.  **A combining function** that takes the current accumulator and the next item in the list, and returns a new accumulator.



If you have an array `[1, 2, 3, 4]` and you want to sum it using a left fold (which processes from left to right) with a starting accumulator of `0`, the execution looks like this:

1.  $f(0, 1) = 1$
2.  $f(1, 2) = 3$
3.  $f(3, 3) = 6$
4.  $f(6, 4) = 10$

**The fundamental limitation of a fold:** Because step 2 strictly requires the output of step 1, a standard fold is inherently sequential. You cannot easily split this across multiple CPU cores because every step depends on the previous step's calculated state. 

---

##### The Conjugate Transform on the Average Problem

To run operations in parallel, the combining function must be **associative** (meaning the grouping of operations doesn't matter, e.g., $(A + B) + C = A + (B + C)$). If an operation is associative, we call it a **Monoid**, and we can split the work across multiple threads without waiting for previous steps to finish.

The problem with calculating an average is that **averaging is not associative**. 
$$\text{Avg}(\text{Avg}(10, 20), 30) = \text{Avg}(15, 30) = 22.5$$
$$\text{Avg}(10, \text{Avg}(20, 30)) = \text{Avg}(10, 25) = 17.5$$

Because $22.5 \neq 17.5$, you cannot just chop an array into chunks, average the chunks on different CPU cores, and then average the results together.

**The Solution: The Conjugate Transform**
The Conjugate Transform is a mathematical sleight of hand. When you have a non-associative operation (like Average), you transform the data into a different structure where the operation *is* associative, do the parallel computation there, and then transform the final result back.



Here is how you apply it to the Average problem in three steps:

**1. Map (The Forward Transform)**
Instead of looking at the data as single numbers, we map every single number $x$ into a tuple containing the number itself (acting as a sum) and the number `1` (acting as a count).
$$x \to (x, 1)$$
For example, the array `[10, 20, 30]` becomes `[(10, 1), (20, 1), (30, 1)]`.

**2. Reduce (The Monoid Operation)**
Now we define a new combining operation ($\oplus$) for these tuples. We just add the sums together and the counts together.
$$(S_1, C_1) \oplus (S_2, C_2) = (S_1 + S_2, C_1 + C_2)$$

Because basic addition *is* associative, this new tuple operation is a valid Monoid. This means you can now distribute these tuples across thousands of servers. Server A can combine the first half, Server B can combine the second half, and they can merge their results perfectly without sequence dependencies. 

If we reduce our example array:
$$((10, 1) \oplus (20, 1)) \oplus (30, 1) \implies (30, 2) \oplus (30, 1) \implies (60, 3)$$

**3. Extract (The Backward Transform)**
Once your parallel system has reduced millions of records down to one single final tuple $(S_{total}, C_{total})$, you apply the final extraction function to get your actual answer.
$$\text{Average} = \frac{S_{total}}{C_{total}}$$
For our example: $60 / 3 = 20$.

By temporarily changing the shape of the data (from a single number to a sum/count pair), you bypassed the sequential bottleneck of the `fold` and allowed the system to compute the average in parallel.

---

### you asked

message time: 2026-06-26 09:07:16

Https://williamdue.github.io/blog/parallel-parentheses-matching

---

### gemini response

The blog post by William Due explores how to take another seemingly sequential algorithm—**Parentheses Matching**—and convert it into a parallelizable, associative operation using a specific monoid known as the **Bicyclic Semigroup**. 

As a CS engineer, you know that the textbook way to validate or match parentheses is sequential: loop through the string, push `(` onto a stack, pop when you see `)`, and check if the stack is empty at the end. Because the state at index $i$ depends on the stack state at $i-1$, it’s inherently sequential.

Here is the exact mathematical and algorithmic breakdown of how the blog post parallelizes it using the Futhark language (a high-performance, parallel data-functional language).

---

##### 1. The Core Monoid: The Bicyclic Semigroup

To solve this in parallel, we need a map-reduce style **Conjugate Transform**. We must map each parenthesis character to an intermediate tuple data structure that captures its structural requirement, and then define an associative binary operation to merge these chunks.

For any substring of parentheses, we can reduce its state down to two numbers:
1.  **$U$ (Unmatched Closes):** The number of `)` brackets that couldn't find a matching `(` to their left *within this chunk*.
2.  **$O$ (Unmatched Opens):** The number of `(` brackets that couldn't find a matching `)` to their right *within this chunk*.

We represent the state of any chunk as a tuple: **$(U, O)$**.

###### The Forward Transform (Map)
* An opening parenthesis `(` is mapped to: **$(0, 1)$** (It needs 0 closes to its left, and leaves 1 unmatched open).
* A closing parenthesis `)` is mapped to: **$(1, 0)$** (It needs 1 open to its left, and leaves 0 unmatched opens).

###### The Combining Operation (Reduce)
Suppose we have two adjacent text chunks: Left Chunk $(U_1, O_1)$ and Right Chunk $(U_2, O_2)$. When we place them next to each other, the unmatched opens from the left chunk ($O_1$) will try to cancel out the unmatched closes from the right chunk ($U_2$).


The mathematical combining operation $\oplus$ is defined as:
$$(U_1, O_1) \oplus (U_2, O_2) = (U_1 + \max(0, U_2 - O_1), \, O_2 + \max(0, O_1 - U_2))$$

* **Why is this associative?** Because it maps precisely to the composition rule of the *bicyclic semigroup* (the syntactic monoid of the Dyck language). If you take three chunks, $(A \oplus B) \oplus C = A \oplus (B \oplus C)$. 
* **The Identity Element:** The empty string maps to $(0, 0)$.

Because this operation is associative, we can throw a raw string of billions of parentheses onto a GPU. The GPU can split the string into arbitrary fragments, map them to $(U, O)$ pairs, and execute a standard parallel reduction tree. If the final global tuple is exactly **$(0, 0)$**, the entire string is perfectly balanced.

---

##### 2. Going Beyond Validation: Finding the Match Index

Validating a string is a great first step, but what if you actually need to find the **exact index** of the matching partner for every parenthesis in the string? (e.g., for parsing a context-free grammar or building abstract syntax trees).

The post extends the binary reduction idea to compute the global nesting depth using a **Prefix Sum (Scan)**.

1.  **Assign Weights:** Change `(` to $+1$ and `)` to $-1$.
2.  **Parallel Scan:** Compute a parallel prefix sum over the array. This gives you the nesting depth at every individual character index.
3.  **The Matching Invariant:** An opening parenthesis at index $i$ with a prefix depth of $d$ will match with the *first* closing parenthesis to its right (at index $j > i$) that drops back down to a prefix depth of $d - 1$.


To find that index $j$ in parallel without a sequential scan, the algorithm uses a **Range Minimum Query (RMQ)** tree or a binary search over segment trees. Because the nesting depth values between matching brackets will never drop below $d-1$, finding the matching partner becomes an associative range search problem.

##### Summary of System Benefits
By shifting from a stack-allocation approach to the Bicyclic Semigroup monoid:
* **Data Partitioning:** You can split a source file across 4,000 GPU threads arbitrarily.
* **Time Complexity:** The execution time drops from sequential $O(N)$ on a single CPU core to a parallel step complexity of **$O(\log N)$** on hardware like a GPU or a multi-core vector machine.
* **Memory Access:** It transforms pointer-heavy stack manipulation into highly sequential, cache-friendly array scans and reductions.

---

### you asked

message time: 2026-06-26 09:12:32

There was also a example of 2 type of paranthesis how would that solve it

---

### gemini response

If you introduce multiple types of parentheses—like `()`, `[]`, and `{}`—the standard `(U, O)` number-counting trick completely breaks down. 

In formal computer science, moving from one bracket type to multiple bracket types means shifting from the standard Dyck language to the **Dyck-$n$ language**. If we just counted unmatched brackets, a string like `([)]` would evaluate to perfectly balanced because the total counts would equal zero, completely ignoring that the types are woven incorrectly. 

To solve this in parallel, we have to upgrade our mathematical structure from the Bicyclic Semigroup to what is often called the **Stack Monoid**.

Here is how the algorithm adapts.

##### 1. The Upgraded Data Structure: Strings Instead of Integers
Instead of tracking the *count* of unmatched brackets `(U, O)`, we must track the *actual sequence* of those unmatched brackets. 

We represent the state of any chunk of text as a pair of bounded stacks (or strings): **$(L, R)$**.
* **$L$ (Left-facing closes):** A string of unmatched closing brackets that are looking for an opening partner to their *left*.
* **$R$ (Right-facing opens):** A string of unmatched opening brackets that are looking for a closing partner to their *right*.

###### The Forward Transform (Map)
* An opening bracket `[` is mapped to: **$(\text{empty}, \text{"["})$** * A closing bracket `)` is mapped to: **$(\text{")"}, \text{empty})$** ##### 2. The Upgraded Reduce Operation: Stack Cancellation

When we concatenate two adjacent chunks in parallel—Left Chunk $(L_1, R_1)$ and Right Chunk $(L_2, R_2)$—the unmatched opens facing right ($R_1$) crash into the unmatched closes facing left ($L_2$).

Instead of simple addition and subtraction, the reduce operation $\oplus$ now acts as a **string cancellation function**.

Imagine Chunk 1 has the state: $(\text{empty}, \text{"( \{"})$ 
Imagine Chunk 2 has the state: $(\text{"\}"}, \text{"["})$ 

When we evaluate Chunk 1 $\oplus$ Chunk 2:
1. We look at the "collision zone": the right side of $R_1$ and the left side of $L_2$. 
2. $R_1$ ends with `{` and $L_2$ begins with `}`. 
3. Because `{` and `}` are a valid pair, they annihilate each other.
4. The remaining uncanceled brackets combine to form the new state: **$(\text{empty}, \text{"( ["})$**.

##### 3. Handling the "Poison" State (Mismatches)
What happens if the collision zone doesn't match? 
Suppose $R_1$ ends with `[` but $L_2$ begins with `)`. 

Because they cross over each other invalidly (e.g., `[ )`), the string is permanently broken. We introduce a special **`INVALID`** state to our monoid. 
* Any chunk that results in an invalid match becomes `INVALID`. 
* The $\oplus$ operation is defined such that `INVALID` $\oplus$ *anything* = `INVALID`. 
This acts as a "poison" that propagates all the way to the top of the parallel reduction tree.


##### Why this is still a Monoid
Even though we are now doing string matching and cancellation instead of basic integer math, this stack cancellation operation is still **strictly associative**. 

Evaluating $(A \oplus B) \oplus C$ yields the exact same final stack state as $A \oplus (B \oplus C)$. 

This means you can take a massive 10 GB JSON or XML file, slice it into thousands of arbitrary byte-chunks, and hand them to thousands of GPU cores. Each core processes its chunk into a local $(L, R)$ stack pair, and the system reduces those pairs in a giant binary tree. If the final global state is exactly **$(\text{empty}, \text{empty})$**, the entire file has perfectly validated syntax.

---

### you asked

message time: 2026-06-26 09:16:07

How does this make parallelism, if like only 2 can be evaluated at the same time

---

### gemini response

This is a fantastic question and points to a very common intuition trap. 

It is true that the combining operation ($\oplus$) is strictly **binary**—meaning a single CPU core evaluating $A \oplus B$ can only look at two chunks at exactly the same time. 

The parallelism doesn't come from doing a single massive operation on everything at once; it comes from **doing thousands of these small, 2-chunk operations simultaneously across different cores.** This is known as a **Binary Reduction Tree**.



Here is exactly how the execution scales to achieve massive parallelism.

##### The Sequential Way ($O(N)$ Time)
If your operation is not associative, you are forced to process elements one by one. If you have 8 elements, a single CPU core must process them in sequence:
1. $R_1 = A \oplus B$
2. $R_2 = R_1 \oplus C$
3. $R_3 = R_2 \oplus D$
... and so on.
This takes **7 sequential time steps**. Even if you have a GPU with 4,000 cores, 3,999 of them will sit completely idle because step 2 *cannot start* until step 1 finishes. 

##### The Parallel Way ($O(\log N)$ Time)
Because our Stack Monoid operation is associative, the order of grouping doesn't matter. We can structure the computation as a tree. 

Imagine you have 8 chunks of text and 4 CPU cores:
* **Time Step 1 (4 operations simultaneously):**
  * Core 1 calculates $R_1 = A \oplus B$
  * Core 2 calculates $R_2 = C \oplus D$
  * Core 3 calculates $R_3 = E \oplus F$
  * Core 4 calculates $R_4 = G \oplus H$
* **Time Step 2 (2 operations simultaneously):**
  * Core 1 calculates $R_5 = R_1 \oplus R_2$
  * Core 2 calculates $R_6 = R_3 \oplus R_4$
* **Time Step 3 (1 operation):**
  * Core 1 calculates $\text{Final} = R_5 \oplus R_6$

Instead of 7 time steps, it only took **3 time steps**. 

##### Scaling to Big Data
Now, zoom out to a real-world scenario. Imagine you are parsing a 1 GB source code file containing 1,000,000 parenthesis brackets, and you hand this to a modern GPU.

1. The GPU slices the file into 1,000,000 individual characters.
2. **Step 1:** 500,000 GPU threads fire at the exact same millisecond. Each thread merges exactly 2 characters. 
3. **Step 2:** 250,000 threads fire simultaneously, merging the results of Step 1.
4. **Step 3:** 125,000 threads fire simultaneously...

Instead of taking 1,000,000 sequential loops in a `for` loop, the GPU collapses the entire file in just **20 steps** (because $\log_2(1,000,000) \approx 20$). 

This is the magic of monoids and associative math. By ensuring that any two adjacent chunks can be merged without needing to know the context of the rest of the string, you unlock a divide-and-conquer architecture that allows every available hardware core to work at the same time.


# july 07

## L4 Load Balancer

### **1. The Foundational Context: The OSI Model**

To truly understand an L4 Load Balancer, we must first look at the **OSI (Open Systems Interconnection) Model**, which is a conceptual framework that standardizes the functions of a telecommunication or computing system into 7 distinct layers.

- **Layer 7 (Application Layer):** This is where HTTP, HTTPS, WebSockets, and SSH live. It contains the actual "payload" (the data the user cares about, like a JSON payload, URL path, or HTTP headers).
    
- **Layer 4 (Transport Layer):** This is where TCP (Transmission Control Protocol) and UDP (User Datagram Protocol) live.
    
    - **The Crucial Distinction:** A Layer 4 load balancer operates **strictly at this layer**. It does not possess the capability to decrypt or look inside the Layer 7 data. It is completely blind to whether the user is requesting `/api/users` or `/api/payments`. It only knows: _"A packet came from IP Address A (Port X) and wants to go to IP Address B (Port 80)."_
        

### **2. Deep Dive: Layer 4 Load Balancing**

Because an L4 load balancer only looks at the IP address and Port numbers, its routing decisions are purely mathematical and network-based. It relies on a "5-tuple" to track connections:

1. Source IP Address
    
2. Source Port
    
3. Destination IP Address
    
4. Destination Port
    
5. Protocol (TCP or UDP)
    

**Why use L4 if it's blind to data?**

Because it doesn't spend CPU cycles inspecting payloads, L4 load balancing is incredibly fast, highly efficient, and uses very little compute power.

### **3. The Two Modes of L4 Load Balancing**

The video highlights two distinct architectures for how an L4 load balancer handles traffic: **Pass-Through Mode** and **Proxy Mode**.

#### **Architecture A: Pass-Through Mode (Packet Forwarding)**

In this mode, the load balancer acts like a high-speed router. It does not "terminate" or stop the connection. It simply alters the network packets on the fly and shoves them forward.

- **The TCP Connection:** There is only **one** TCP handshake. The client initiates a TCP handshake that goes _through_ the load balancer and completes directly with the chosen backend server.
    
- **How it works (Step-by-Step):**
    
    1. Client sends a packet to the Load Balancer's IP (e.g., `192.168.1.100`).
        
    2. The Load Balancer uses a fast algorithm (like Hashing the Source IP or simply picking Randomly) to select a backend server (e.g., `Server A: 192.168.1.101`).
        
    3. The Load Balancer modifies the Destination MAC address of the packet and passes it to Server A.
        
    4. **Masquerading (NAT):** When Server A replies, the response must go back through the Load Balancer so it can rewrite the Source IP back to its own. If it didn't do this, the client would receive a packet from an unknown IP (`192.168.1.101`) and drop it, since it expects a reply from `192.168.1.100`.
        
- **Tools Used:** Linux `iptables` or `nftables`.
    
- **Pros:** Extremely low latency; handles massive throughput.
    
- **Cons:** Very rigid. You cannot do smart routing based on server load because the load balancer isn't managing the connections, it's just passing packets.
    

#### **Architecture B: Proxy Mode (Connection Termination)**

In this mode, the load balancer acts as a true "middleman." It actively intercepts the connection, fully manages it, and creates a separate connection to the backend.

- **The TCP Connection:** There are **two** distinct TCP connections.
    
    - _Connection 1:_ Client ↔ Load Balancer
        
    - _Connection 2:_ Load Balancer ↔ Backend Server
        
- **How it works (Step-by-Step):**
    
    1. Client initiates a TCP handshake. The Load Balancer accepts it and completes the handshake itself.
        
    2. The Load Balancer looks at its pool of backend servers. Because it holds the connection, it has time to think.
        
    3. It evaluates metrics: _"Which server has the fewest active TCP connections? Which server is currently healthy?"_
        
    4. It selects Server B, opens a _new_ TCP connection to Server B, and streams the raw bytes from the client into this new connection.
        
- **Tools Used:** HAProxy (in TCP mode), NGINX (in Stream mode), Envoy.
    
- **Pros:** * **Smarter Routing:** Can use algorithms like "Least Connections" or "Weighted Round Robin".
    
    - **Health Checks:** The load balancer can actively ping backend servers to ensure they are alive before sending traffic.
        
    - **Observability:** You get metrics on TCP connection drops, latency, and retries.
        
- **Cons:** Slightly higher latency and CPU usage than Pass-Through mode because the load balancer has to manage two TCP states in memory per user.
    

### **4. Summary Comparison Table**

|**Feature**|**Pass-Through Mode**|**Proxy Mode**|
|---|---|---|
|**TCP Connections**|1 (Client directly to Backend)|2 (Client to LB, LB to Backend)|
|**Routing Logic**|Primitive (Random, IP Hash)|Advanced (Least Connections, Health Checks)|
|**Performance**|Maximum throughput, lowest latency|High throughput, slight latency overhead|
|**Load Balancer Role**|Network Router / Packet Forwarder|Active Middleman / Connection Manager|
|**Example Tech**|Linux `iptables`, AWS NLB (some modes)|HAProxy, NGINX (Stream), Envoy|

# July 10
## Browser Fingerprinting

> **Browser fingerprinting** is a tracking technique that collects unique technical details about your browser and device to create a digital "fingerprint." 
> 
> *Unlike cookies, it works silently in the background, cannot be cleared by deleting your history, and continues tracking you even in incognito mode.*

### How Browser Fingerprinting Works

When you visit a website, your browser automatically shares certain parameters so the page displays correctly. Tracking scripts gather dozens of these signals and combine them into a unique identifier. 

While millions of people might share one trait (like using Windows), the exact combination of all your settings is mathematically unique to you. The result is converted into a single hash — a tracking ID that follows you across sites.

**Examples of Visible System Signals:**
- IP Address
- Browser (e.g., Chrome 149)
- Operating System (e.g., Linux)
- Screen Resolution (e.g., 1920×1080)
- Cookies (Enabled/Disabled)
- Language (e.g., en-US)
- Pixel Ratio (e.g., 1x)

---

### Common Fingerprinting Techniques

- **Canvas fingerprinting:** A script instructs your browser to draw a hidden image (text, shapes, color gradients) that is never shown on screen. Because every combination of GPU, graphics driver, and OS renders the image with tiny differences, the resulting pixels form a stable identifier.
- **WebGL & WebGPU probing:** Scripts request a small 3D scene, measure how your hardware completes the rendering task, and read vendor strings directly from the API to reveal specific GPU models and drivers.
- **Font & plugin enumeration:** Scripts test which fonts are installed on your system by measuring how text renders in each one, and probe for browser extensions. 
- **Audio fingerprinting:** The Web Audio API lets a script generate and process a sound signal in the background. Small differences in audio hardware and software processing produce measurably different output from the same input.
- **Media & device APIs:** Browsers expose information about connected monitors, supported audio/video codecs, and battery status. 

---

### Why Websites Use Fingerprinting

Fingerprinting is a neutral technique. What varies is who is using it and why:

1. **Advertising and Profiling:** Ad tech companies build behavioral profiles (pages read, products viewed) across unrelated websites to target ads without any visible indication.
2. **Fraud & Bot Prevention:** Banks and security platforms use it to flag suspicious login attempts from unrecognized devices and to distinguish real visitors from bots.
3. **Preventing Abuse:** Streaming services use it to detect account sharing, and online games use it to re-identify banned cheaters who create fresh accounts.

---

### How to Protect Yourself

Because fingerprinting targets inherent device characteristics rather than stored data, it is harder to stop than cookies. You can only change what your browser reveals, or make it blend in with others.

#### Browser Options
- **Brave Browser:** Randomizes canvas, WebGL, audio, and font fingerprinting signals on every session. *(Best mainstream option; on by default).*
- **Firefox:** Go to `about:config` and toggle `privacy.resistFingerprinting` to `true`. Firefox will report standardized values for signals. *(May occasionally break sites).*
- **Tor Browser & Mullvad Browser:** Standardizes everything so every user looks identical. *(Strongest approach for high-sensitivity use, but trades off speed).*

#### Best Practices
- **Minimize extensions:** Paradoxically, installing many privacy extensions makes your fingerprint *more* unique because the unusual combination becomes an identifier itself. A stock browser configuration blends in better.
- **VPNs do not stop fingerprinting:** A VPN changes your IP address, but your canvas rendering, fonts, GPU details, and everything else stay exactly the same. 

---

### FAQ

**Can browser fingerprinting track me in incognito mode?**
Yes. Incognito mode only prevents local history storage. Your browser still exposes the exact same technical signals.

**Does a VPN prevent browser fingerprinting?**
No. A VPN protects your IP address, but does not affect your browser fingerprint.

**What is the difference between cookies and browser fingerprinting?**
Cookies are stored on your device and can be deleted. Browser fingerprinting reads your device's existing technical characteristics and exists as long as your device and browser settings remain the same.

**Is browser fingerprinting legal?**
In most jurisdictions, yes. The EU's ePrivacy Directive requires consent for fingerprinting, but enforcement has been inconsistent.

---
*Resource:* [MySysInfo.com](https://mysysinfo.com) (Check what your browser reveals)
