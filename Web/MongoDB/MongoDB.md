
Different Database Comparison
https://circleci.com/blog/sql-vs-nosql-databases/



commands cheatsheet
https://www.mongodb.com/developer/products/mongodb/cheat-sheet/
## mongosh

```sh
show dbs
cls
db.books.insertOne()
insertMany()
find() - print 20     use command  'it' for next 20
find({author:"terry"}{title:1}) find all teryy and only show book title
findOne()


method chaining

find().count()
find().limit(3)
find().limit(3).count()
find().sort({title:1})     1-ascending
                                   -1 descending

find({rating:{$gt: 7}})
find({rating:{$gte: 7}})
find({rating:{$lt: 8}})
find({rating:{$lte: 8}})
find({rating:{$gt:7}})

find({$or : [{rating:7},{rating:9}]})



find({rating:{$in: [7,8,9]}})
find({rating:{$nin: [7,8,9]}})

deleteOne()
deleteMany()


updateOne({id : 34454},{$set:{author:"hello",pages:400}})
updateMany()


$inc
$pull
$push
$each






paginate


db.books.createIndex({rating:8})
db.books.getIndexes()
```
![[Screenshot_20231215_060516.png]]


```

querying array
$all


```
![[Screenshot_20231215_054629.png]]



