 
Progress 32



# Basics CPP
bits/stdc++
 
![[Screenshot_20230717_035508.png]]

operator precedences


overflows 
int 10e9
long 10e18

double and float have precision problem

str.size

getline(cin,str1)
{if getline after cin then one line will be empty}


s.pushback() is faster than adding in strings

arrays
global arrays need constant variable and initialized to 0;
local limit of size = 1e5 order
global limit of size = 1e7 order


main return 0 as successful execution
string is also passed by value
pass by reference in cpp
```
addsix(int &n){}
..
..
int main(){
int a = 5;
addsix(a);
}
```
array is always passed as reference

pointers in c



# Basic CP

## Basics
timecomplexity 1e7 in 1 second

modulus

(a+b)%m = ((a%m)+(b%m))%m
(a\*b)%m = ((a%m)\*(b%m))%m
(a-b)%m = ((a%m)-(b%m)+m)%m
(a/b)%m=((a%m)\*(b^-1)%m)%m
 //{b^-1 is modular multiplicative inverse https://www.wikiwand.com/en/Modular_multiplicative_inversei}


## Precomputation technique


```
const N = 1e7
long long fact[N]
..
..
int main(){
fact[0]=fact[1]=1;
for (int i=2;i<N;i++){
fact[i]= i * fact[i-1]
}

int t
while (t--){
...
...
...
}
}
```

**Hashing**
```
const N = 1e7
int hsh[N]
..
..
int main(){
int t;
while (t--){
for (int i=0;i<N;i++){
cin >> temp;
hsh[temp]++
}
...
...
}
}




```

**Prefix Sum**
1D/2D


\_\_gcd(a,b)


Recursion
time complexity = no of function calls * complexity of each call

 mergesort

# STL

**Pairs**
pair<int,string> p;
p = {2,"abc"}; or p = make_pair(9,"abc")
**Vectors**
```cpp
vector<int> v;
v.push_back(x);
v.pop_back()
v.size();
v.capacity();
v.clear();
v.front();
v.back();
v.empty();
v[i] to access a particular element
vector<int> v2 = v;array m ese reference jata h pr vector m copy banti h
vector should passed by reference if dont want to make copy (vector<int> &v)
```

**Iterators**
```

vector<int> :: iterator it = v.begin

```
\*it for value

it+1 give next memory address value
it++ give next iterator

vector of pair
\*it.first  can  be  it->first same as in sturctures in c

**Range based loops**

```
for (int value : v){
cout << value << " ";
}
//values are copied


for (int &value : v){
cout << value << " ";
}
//values are referenced
```

**auto keyword**
auto it = v.begin()


```cpp
//deque
deque<int> d;
d.push_back(2);
d.push_front(3);
d.pop_back();
d.at(1);
d.front();
d.erase(d.begin(),d.begin()+1)







//List
list<int> l;
l.push_back(2);
l.push_front(2);
list<int> n(5,100);
l.erase(l.begin());
l.size();



//stack
stack<string> s;
s.push("hi");
s.push("hello");
s.pop();
s.top();
s.size();
s.empty();



//queue
queue<string> s;
s.push("hi");
s.pop();
s.size();
s.pop();

////
//priority queue

//max heap
priority_queue<int> maxi;
maxi.push(3);
maxi.push(1);
maxi.top();
max.size();
maxi.pop();

//min heap
priority_queue<int,vector<int>,greater<int>> mini;
////



//set
set<int> s;
s.insert(5);
s.insert(4);
s.insert(4);


map






/////Algorithm
binary_search(v.begin(),v.end(),6);
lower_bound(v.begin(),v.end(),5) - v.begin();
max(a,b);
min(a,b);
swap(a,b);
 
```
