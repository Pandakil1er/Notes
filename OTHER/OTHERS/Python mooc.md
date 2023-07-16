# Chapter 1:

```python
a=1;
type(a)
dynamic typing
The basic data types in Python are: `int`, `float`, `complex`, `str` (a string), `bool` (a boolean with values `True` and `False`), and `bytes`.

print(1, 2, 3, end=' |', sep=' -*- ') print("first", "second", "third", end=' |', sep=' -*- ')

input("whats your name?")
for i in range(3,15,3):
    print("Hello")
print("Bye!")

b="ä".encode("utf-8")     # Convert character(s) to a sequence of bytes
print(b)                  # Prints bytes in hexadecimal notation
print(list(b))            # Prints bytes in decimal notation
output:
b'\xc3\xa4'
[195, 164]

s="""A string
spanning over
several lines"""

Although we can concatenate strings using the + operator, for effiency reasons, one should use the join method to concatenate larger number of strings:

a="first"
b="second"
print(a+b)
print(" ".join([a, b, b, a])) 


print("%i plus %i is equal to %i" % (1, 3, 4))     # Format syntax

print("{} plus {} is equal to {}".format(1, 3, 4)) # Format method

print(f"{1} plus {3} is equal to {4}")             # f-string


print("%.1f %.2f %.3f" % (1.6, 1.7, 1.8))               # Old style
print("{:.1f} {:.2f} {:.3f}".format(1.6, 1.7, 1.8))     # newer style
print(f"{1.6:.1f} {1.7:.2f} {1.8:.3f}")                 # f-string


operators : https://realpython.com/python-operators-expressions/
// floor division
** power

s=0
for i in [0,1,2,3,4,5,6,7,8,9]:
    s = s + i
print("The sum is", s)

i=1
while i*i < 1000:
    print("Square of", i, "is", i*i)
    i = i + 1
print("Finished printing all the squares below 1000.")




c=float(input("Give a number: "))
if c > 0:
    print("c is positive")
elif c<0:
    print("c is negative")
else:
    print("c is zero")




def double(x):
    "This function multiplies its argument by two."
    return x*2
print(double(4), double(1.2), double("abc")) # It even happens to work for strings!


help(print)

def sum_of_squares(*t):
    "Computes the sum of squares of arbitrary number of arguments"
    s=0
    for x in t:
        s += x**2
    return s
print(sum_of_squares(-2))
print(sum_of_squares(-2,4,5))



lst=[1,5,8]
print("With list unpacked as arguments to the functions:", sum_of_squares(*lst))
# print(sum_of_squares(lst))    # Does not work correctly


def named(a, b, c):
    print("First:", a, "Second:", b, "Third:", c)
named(5, c=7, b=8)
First: 5 Second: 8 Third: 7
#Note that the named arguments didn't need to be in the same order as in the function definition. The named arguments must come after the positional arguments. For example, the following function call is illegal named(a=5, 7, 8).


i=2
def f():
    global i
    i=5       # rebind the global i variable
    print(i)  # This will print 5
f()
print(i)      # This will print 5


def f():            # outer function
    b=2
    def g():        # inner function
        nonlocal b # Without this nonlocal statement,
        b=3         # this will create a new local variable
        print(b)
    g()
    print(b)
f()
```

List, tuples, and strings are called _sequences_ in Python, and they have several commonalities:

- their length can be queried with the `len` function
- `min` and `max` function find the minimum and maximum element of a sequence, and `sum` adds all the elements of numbers together
- Sequences can be concatenated with the `+` operator, and repeated with the `*` operator: `"hi"*3=="hihihi"`
- Since sequences are ordered, we can refer to the elements of a sequences by integers using the _indexing_ notation: `"abcd"[2] == "c"`
- Note that the indexing begins from 0
- Negative integers start indexing from the end: -1 refers to the last element, -2 refers to the second last, and so on


```python
slice of seqquence \[first:last:step]


print([0,1,2,3,4,5,6,7,8,9][::3])
[0, 3, 6, 9]


L=[11,13,22,32]
L[1:3]=[4]
print(L)
[11 , 4 , 32]

We can also modify a list by using mutating methods of the list class, namely the methods append, extend, insert, remove, pop, reverse, and sort. Try Python's help functionality to find more about these methods: e.g. help(list.extend) or help(list).


```



```python
L=range(3)
for i in L:
    print(i)
# Note that L is not a list!
print(L)
```

So `L` is not a list, but it is a sequence. We can for instance access its last element with `L[-1]`. If really needed, then it can be converted to a list with the `list` constructor:

```python
L=range(10)
print(list(L))
```


Sorting Sequence
```python
L=[5,3,7,1]
L.sort()      # here we call the sort method of the object L
print(L)
L2=[6,1,7,3,6]
print(sorted(L2))
print(L2)
```

[1, 3, 5, 7]
[1, 3, 6, 6, 7]
[6, 1, 7, 3, 6]

```routeros
L=[5,3,7,1]
print(sorted(L, reverse=True))
```

[7, 5, 3, 1]

**Zipping sequences**

The `zip` function combines two (or more) sequences into one sequence. If, for example, two sequences are zipped together, the resulting sequence contains pairs. In general, if `n` sequences are zipped together, the elements of the resulting sequence contains `n`-tuples. An example of this:

```python
L1=[1,2,3]
L2=["first", "second", "third"]
print(zip(L1, L2))               # Note that zip does not return a list, like range
print(list(zip(L1, L2)))         # Convert to a list
```

<zip object at 0x7fb8141907c8>
[(1, 'first'), (2, 'second'), (3, 'third')]



```python
days="Monday Tuesday Wednesday Thursday Friday Saturday Sunday".split()
weathers="rainy rainy sunny cloudy rainy sunny sunny".split()
temperatures=[10,12,12,9,9,11,11]
for day, weather, temperature in zip(days,weathers,temperatures):
    print(f"On {day} it was {weather} and the temperature was {temperature} degrees celsius.")

# Or equivalently:
#for t in zip(days,weathers,temperatures):
#    print("On {} it was {} and the temperature was {} degrees celsius.".format(*t))

```

**Enumerating sequences**


```python
L=[1,2,98,5,-1,2,0,5,10]
counter = 0
for i, x in enumerate(L):
    if x == 5:
        counter += 1
        if counter == 2:
            break
print(i)
```

7

The `enumerate(L)` function call can be thought to be equivalent to `zip(range(len(L)), L)`.


**Dictionaries**

```python
d={"key1":"value1", "key2":"value2"}
print(d["key1"])
print(d["key2"])
d={}
d[2]="value"
print(d)
```

alt syntax

```python
dict([("key1", "value1"), ("key2", "value2"), ("key3", "value3")]) # list of items
dict(key1="value1", key2="value2", key3="value3");


```


if key is not found than exceptionKeyError error is given

```python

  
Dictionary object contains several non-mutating methods:

```stylus
d.copy()
d.items()
d.keys()
d.values()
d.get(k[,x])
```

Some methods mutate the dictionary:

```stylus
d.clear()
d.update(d1)
d.setdefault(k[,x])
d.pop(k[,x])
d.popitem()
```

```routeros
d=dict(a=1, b=2, c=3, d=4, e=5)
d.values()
```

dict_values([1, 2, 3, 4, 5])

**Sets**
Like dictionary but only store keys

```python
s={1,1,1}
print(s)
s=set([1,2,2,'a'])
print(s)
s=set()  # empty set
print(s)
s.add(7) # add one element
print(s)


s="mississippi"
print(f"There are {len(set(s))} distinct characters in {s}")

The `set` provides the following non-mutating methods:

s=set()
s1=set()
s.copy()
s.issubset(s1)
s.issuperset(s1)
s.union(s1)
s.intersection(s1)
s.difference(s1)
s.symmetric_difference(s1);

The last four operation can also be written as:
s=set([1,2,7])
t=set([2,8,9])
print("Union:", s|t)
print("Intersection:", s&t)
print("Difference:", s-t)
print("Symmetric difference", s^t)


Mutating Method
s.add(x)
s.clear()
s.discard()
s.pop()
s.remove(x)


print(1 in [1,2])
d=dict(a=1, b=3)
print("b" in d)
s=set()
print(1 in s)
print("x" in "text")
True
True
False
True

print("issi" in "mississippi")
print("issp" in "mississippi")
True
False



first, second = [4,5]
a,b,c = "bye"
print(c)
d=dict(a=1, b=3)
key1, key2 = d
print(key1, key2)
e
a b

s="hello"
del s
# print(s)    # This would cause an error



L=[13,23,40,100]
del L[1]
print(L)


L=[ a**3 for a in range(1,11)]
print(L)
[1, 8, 27, 64, 125, 216, 343, 512, 729, 1000]


L=[ 100*a + 10*b +c for a in range(0,10)
                    for b in range(0,10)
                    for c in range(0,10) 
                    if a <= b <= c]
print(L)
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 25, 26, 27, 28, 29, 33, 34, 35, 36, 37, 38, 39, 44, 45, 46, 47, 48, 49, 55, 56, 57, 58, 59, 66, 67, 68, 69, 77, 78, 79, 88, 89, 99, 111, 112, 113, 114, 115, 116, 117, 118, 119, 122, 123, 124, 125, 126, 127, 128, 129, 133, 134, 135, 136, 137, 138, 139, 144, 145, 146, 147, 148, 149, 155, 156, 157, 158, 159, 166, 167, 168, 169, 177, 178, 179, 188, 189, 199, 222, 223, 224, 225, 226, 227, 228, 229, 233, 234, 235, 236, 237, 238, 239, 244, 245, 246, 247, 248, 249, 255, 256, 257, 258, 259, 266, 267, 268, 269, 277, 278, 279, 288, 289, 299, 333, 334, 335, 336, 337, 338, 339, 344, 345, 346, 347, 348, 349, 355, 356, 357, 358, 359, 366, 367, 368, 369, 377, 378, 379, 388, 389, 399, 444, 445, 446, 447, 448, 449, 455, 456, 457, 458, 459, 466, 467, 468, 469, 477, 478, 479, 488, 489, 499, 555, 556, 557, 558, 559, 566, 567, 568, 569, 577, 578, 579, 588, 589, 599, 666, 667, 668, 669, 677, 678, 679, 688, 689, 699, 777, 778, 779, 788, 789, 799, 888, 889, 899, 999]



If one needs only to iterate through the list once, it is more memory efficient to use a generator expression instead. The only thing that changes syntactically is that the surrounding brackets are replaced by parentheses:

G = ( 100*a + 10*b + c for a in range(0,10)
                       for b in range(0,10)
                       for c in range(0,10) 
                       if a <= b <= c )
print(sum(G))   # This iterates through all the elements from the generator
print(sum(G))   # It doesn't restart from the beginning, so all elements are already consumed
60885
0


Similary a dictionary comprehension creates a dictionary:

d={ k : k**2 for k in range(10)}
print(d)
{0: 0, 1: 1, 2: 4, 3: 9, 4: 16, 5: 25, 6: 36, 7: 49, 8: 64, 9: 81}



def double(x):
    return 2*x
L=[12,4,-1]
print(map(double, L))
<map object at 0x7fb81413ef60>
The map function returns a map object for efficiency reasons. However, since we only want print the contents, we first convert it to a list and then print it:

print(list(map(double,L)))
[24, 8, -2]


s="12 43 64 6"
L=s.split()        # The split method of the string class, breaks the string at whitespaces
                   # to a list of strings.
print(L)
print(sum(map(int, L)))  # The int function converts a string to an integer
['12', '43', '64', '6']
125



L=[2,3,5]
print(list(map(lambda x : 2*x+x**2, L)))



def is_odd(x):
    """Returns True if x is odd and False if x is even"""
    return x % 2 == 1         # The % operator returns the remainder of integer division
L=[1, 4, 5, 9, 10]
print(list(filter(is_odd, L)))



L=[1,2,3,4]
from functools import reduce   # import the reduce function from the functools module
reduce(lambda x,y:x+y, L, 0)
10



s="text"
# s[0] = "a"    # This is not legal in Python


s.isalnum() True if all characters are letters or digits
s.isalpha() True if all characters are letters
s.isdigit() True if all characters are digits
s.islower() True if contains letters, and all are lowercase
s.isupper() True if contains letters, and all are uppercase
s.isspace() True if all characters are whitespace
s.istitle() True if uppercase in the beginning of word, elsewhere lowercase
String transformations
The following methods do conversions between lower and uppercase characters in the string. All these methods return a new string.

s.lower() Change all letters to lowercase
s.upper() Change all letters to uppercase
s.capitalize() Change the first character to upper case and change the rest to lower case
s.title() Change to titlecase
s.swapcase() Change all uppercase letters to lowercase, and vice versa
Searching for substrings
All the following methods get the wanted substring as the parameter, except the replace method, which also gets the replacing string as a parameter

s.count(substr) Counts the number of occurences of a substring
s.find(substr) Finds index of the first occurence of a substring, or -1
s.rfind(substr) Finds index of the last occurence of a substring, or -1
s.index(substr) Like find, except ValueError is raised if not found
s.rindex(substr) Like rfind, except ValueError is raised if not found
s.startswith(substr) Returns True if string starts with a given substring
s.endswith(substr) Returns True if string ends with a given substring
s.replace(substr, replacement) Returns a string where occurences of one string are replaced by another
Keep also in mind that the expression "issi" in "mississippi" returns a truth value of whether the first string occurs in the second string.

Trimming and adjusting
s.strip(x) Removes leading and trailing whitespace by default, or characters found in string x
s.lstrip(x) Same as strip but only leading characters are removed
s.rstrip(x) Same as strip but only trailing characters are removed
s.ljust(n) Left justifies string inside a field of length n
s.rjust(n) Right justifies string inside a field of length n
s.center(n) Centers string inside a field of length n


"--".join(["abc", "def", "ghi"])
'abc--def--ghi'


%%timeit
s=""
for x in L:
    s += " " + x
11.8 µs ± 114 ns per loop (mean ± std. dev. of 7 runs, 100000 loops each)

%%timeit
s = " ".join(L)
1.25 µs ± 6.42 ns per loop (mean ± std. dev. of 7 runs, 1000000 loops each)


'abc--def--ghi'.split("--")
['abc', 'def', 'ghi']





The standard library contains hundreds of modules. Hence, it is hard to comprehend what the library includes. The modules therefore need to be organised somehow. In Python the modules can be organised into hierarchies using packages. A package is a module that can contain other packages and modules. For example, the numpy package contains subpackages core, distutils, f2py, fft, lib, linalg, ma, numarray, oldnumeric, random, and testing. And package numpy.linalg in turn contains modules linalg, lapack_lite and info.

import numpy.linalg imports the subpackage only, and
import numpy.linalg.linalg imports the module only


from numpy.linalg import linalg as lin


from numpy.linalg.linalg import det


numpy    package
  .
linalg   subpackage
  .
linalg   module
  .
 det     function

```

## Summary

- We have learned that Python's code blocks are denoted by consistent indenting, with spaces or tabs, unlike in many other languages
- Python's `for` loops goes through all the elements of a container without the need of worrying about the positions (indices) of the elements in the container
- More generally, an iterable is an object whose elements can be gone through one by one using a `for` loop. Such as `range(1,7)`
- Python has dynamic typing: the type of a name is known only when we run the program. The type might not be fixed, that is, if a name is created, for example, in a loop, then its type might change at each iteration.
- Visibility of a name: a name that refers to a variable can disappear in the middle of a code block, if a `del` statement is issued!
- Python is good at string handling, but remember that if you want to concatenate large number of strings, use the `join` method. Concatenating by the `+` operator multiple times is very inefficient
- Several useful tools exist to process sequences: `map`, `reduce`, `filter`, `zip`, `enumerate`, and `range`. The unnamed lambda function can be helpful with these tools. Note that these tools (except the `reduce`) don't return lists, but iterables, for efficiency reasons: Most often we don't want to store the result from these tools to a container (such as a list), we may only want to iterate through the result!