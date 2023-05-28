1. array.filter to filter items in array based on some function
e.g.
```
const fifteen = inventors.filter(inventor => (inventor.year >= 1500 && inventor.year < 1600));

```

2. array.map to apply function to every element and return same size array
 e.g
 ```
const fullNames = inventors.map(inventor => `${inventor.first} ${inventor.last}`);
    console.log(fullNames);
```

3. arr.sort to sort on basis of some function 1 means switch first element with second -1 means not switch    e.g.
 ```
3. Sort the inventors by birthdate, oldest to youngest

const ordered = inventors.sort(function(a, b) {

if(a.year > b.year) {

return 1;

} else {

return -1;

}

});

```

4. arr.reduce to find sum and all ..  e.g.

```
const totalYears = inventors.reduce((total, inventor) => {

return total + (inventor.passed - inventor.year);

}, 0);

```
5. arr.some to check if any element have the requirement e.g.

```
const isAdult = people.some(person => ((new Date()).getFullYear()) - person.year >= 19);
```
6. arr.every to check if every element have requirement e.g.

```
const allAdults = people.every(person => ((new Date()).getFullYear()) - person.year >= 19);

```
7. array.find to find the first instance of thing e.g.
  ```
const allAdults = people.every(person => ((new Date()).getFullYear()) - person.year >= 19);
```
8. array.findIndex to find index of first instance e.g.
```
const index = comments.findIndex(comment => comment.id === 823423);
```
9. array.splice to remove element from array this remove one element sstarting from index index :
```
comments.splice(index, 1);
```

same can be done with 
```
const newComments = [

...comments.slice(0, index),

...comments.slice(index + 1)

];
```

