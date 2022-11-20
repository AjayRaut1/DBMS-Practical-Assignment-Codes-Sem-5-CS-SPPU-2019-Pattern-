Assignment Number B2
Aggregation and Indexing

use db;
1.] Create collection student

db.createCollection('student');

2.] Insert 10 records in student

db.student.insertMany([

{
	_id:1,
	rollNo:101,
	regNo:10001,
	name:'Sameer',
	dept: 'Computer',
	marks : [95, 90, 92, 91, 93]
},
{
	_id:2,
	rollNo:102,
	regNo:10002,
	name:'Sahil',
	dept: 'Civil',
	marks : [92, 91, 92, 91, 90]
},
{
	_id:3,
	rollNo:103,
	regNo:10003,
	name:'Rohit',
	dept: 'ENTC',
	marks : [90, 98, 97, 96, 99]
},
{
	_id:4,
	rollNo:104,
	regNo:10004,
	name:'Yash',
	dept: 'IT',
	marks : [95, 94, 93, 90, 90]
},
{
	_id:5,
	rollNo:105,
	regNo:10005,
	name:'Kalash',
	dept: 'Mechanical',
	marks : [92, 98, 94, 96, 93]
},
{
	_id:6,
	rollNo:106,
	regNo:10006,
	name:'	Aditya',
	dept: 'Electrical',
	marks : [98, 96, 94, 93, 92]
},
{
	_id:7,
	rollNo:107,
	regNo:10007,
	name:'Dhruv',
	dept: 'Civil',
	marks : [98, 99, 97, 93, 92]
},
{
	_id:8,
	rollNo:108,
	regNo:10008,
	name:'Utkarsh',
	dept: 'IT',
	marks : [90, 90, 90, 96, 92]
},
{
	_id:9,
	rollNo:109,
	regNo:10009,
	name:'Vinay',
	dept: 'Mechanical',
	marks : [91, 92, 93, 94, 95]
},
{
	_id:10,
	rollNo:110,
	regNo:10010,
	name:'Shashank',
	dept: 'Computer',
	marks : [99, 98, 97, 96, 95]
},
]);

3.] Display all Records from 'student' collection

db.student.find().pretty();

A.] Indexing:
//Execution status before creating an index on rollNo field

db.student.explain("executionStats").find({rollNo:9});

//Creating Simple index on rollNo field.

db.student.createIndex({rollNo:1});

//getIndexes()

db.student.getIndexes();

//Compound Index:
//Create compound index on fields rollNo and name

db.student.createIndex({'rollNo':1,'name':1});

db.Student.getIndexes()

//Display 'executionStats' before creating Index on 'regNo' field. (Use of explain())

db.student.explain("executionStat").find({regNo:10007})

//Create unique index on 'regNo' field. (Use of createIndex() and unique)

db.student.createIndex({"regNo":1}, {unique:true})

//Display 'executionStats' after creating Index on 'regNo' field. (Use of explain())

db.student.explain("executionStats").find({regNo:100007})

B.] Aggregation

1.] Display total marks of all students

db.student.aggregate([
{
	$unwind:'$marks'
},
{
	$group:{'_id':'$rollNo','totalScore':{$sum:'$marks'}}
}
]);

2.] Display the total marks of all students in decreasing order.

db.student.aggregate([
{
	$unwind:'$marks'
},
{
	$group:{'_id':'$rollNo','totalScore':{$sum:'$marks'}}
},
{
	$sort:{'totalScore':-1}
}
]);

3.] Display the total marks of 'Computer' department students in decreasing order.

db.student.aggregate(
{
	$unwind:'$marks'
},
{
	$match: {dept : 'Computer'}
},
{
	$group : {'_id':'$rollNo','totalScore':{$sum:'$marks'}}
},
{
	$sort : {'totalScore':-1}	
}
);

4.] Find the highest scorer in all departments.

db.student.aggregate([
{
	$unwind:'$marks'
},
{
	$group:{'_id':'$rollNo','totalScore':{$sum:'$marks'}}
},
{	
	$sort:{'totalScore':-1}
},
{
	$limit	:1
}
]);

5.] Find the highest scorer in 'Computer' department.

db.student.aggregate([
{
	$unwind:'$marks'
},
{
	$match: {dept : 'Computer'}
},
{
	$group:{'_id':'$rollNo','totalScore':{$sum:'$marks'}}
},
{	
	$sort:{'totalScore':-1}
},
{
	$limit	:1
}
]);

6.] Find the highest scorer in 'IT' department.

db.student.aggregate([
{
	$unwind:'$marks'
},
{
	$match: {dept : 'IT'}
},
{
	$group:{'_id':'$rollNo','totalScore':{$sum:'$marks'}}
},
{	
	$sort:{'totalScore':-1}
},
{
	$limit	:1
}
]);

7.] Find the highest scorer in 'ENTC' department.

db.student.aggregate([
{
	$unwind:'$marks'
},
{
	$match: {dept : 'ENTC'}
},
{
	$group:{'_id':'$rollNo','totalScore':{$sum:'$marks'}}
},
{	
	$sort:{'totalScore':-1}
},
{
	$limit	:1
}
]);

8.] Find the highest scorer in 'Civil' department.

db.student.aggregate([
{
	$unwind:'$marks'
},
{
	$match: {dept : 'Civil'}
},
{
	$group:{'_id':'$rollNo','totalScore':{$sum:'$marks'}}
},
{	
	$sort:{'totalScore':-1}
},
{
	$limit	:1
}
]);

9.] Find the highest scorer in 'Mechanical' department.

db.student.aggregate([
{
	$unwind:'$marks'
},
{
	$match: {dept : 'Mechanical'}
},
{
	$group:{'_id':'$rollNo','totalScore':{$sum:'$marks'}}
},
{	
	$sort:{'totalScore':-1}
},
{
	$limit	:1
}
]);

