ASSIGNMENT NUMBER 3
MAP REDUCE IN MONGODB

1.] CREATE COLLECTION 'Orders'

db.createCollection("Orders")

2.] Insert Atleast 30 records in 'Orders'

db.Orders.insert({_id:1, custId:101, ordDate:new Date("2021-11-01"), price:25})

db.Orders.insert({_id:2, custId:101, ordDate:new Date("2021-11-08"), price:70})

db.Orders.insert({_id:3, custId:102, ordDate:new Date("2021-11-08"), price:50})

db.Orders.insert({_id:4, custId:102, ordDate:new Date("2021-11-18"), price:25})

db.Orders.insert({_id:5, custId:102, ordDate:new Date("2021-11-19"), price:50})

db.Orders.insert({_id:6, custId:103, ordDate:new Date("2021-11-19"), price:35})

db.Orders.insert({_id:7, custId:103, ordDate:new Date("2021-11-20"), price:25})

db.Orders.insert({_id:8, custId:104, ordDate:new Date("2021-11-20"), price:75})

db.Orders.insert({_id:9, custId:104, ordDate:new Date("2021-11-20"), price:55})

db.Orders.insert({_id:10, custId:104, ordDate:new Date("2021-11-23"), price:15})

db.Orders.insert({_id:11, custId:105, ordDate:new Date("2021-11-24"), price:85})

db.Orders.insert({_id:12, custId:105, ordDate:new Date("2021-11-24"), price:65})

db.Orders.insert({_id:13, custId:105, ordDate:new Date("2021-11-25"), price:75})

db.Orders.insert({_id:14, custId:106, ordDate:new Date("2021-11-25"), price:65})

db.Orders.insert({_id:15, custId:106, ordDate:new Date("2021-11-25"), price:35})

db.Orders.insert({_id:16, custId:106, ordDate:new Date("2021-11-26"), price:95})

db.Orders.insert({_id:17, custId:106, ordDate:new Date("2021-11-26"), price:65})

db.Orders.insert({_id:18, custId:107, ordDate:new Date("2021-11-26"), price:55})

db.Orders.insert({_id:19, custId:107, ordDate:new Date("2021-11-27"), price:95})

db.Orders.insert({_id:20, custId:107, ordDate:new Date("2021-11-27"), price:85})

db.Orders.insert({_id:21, custId:107, ordDate:new Date("2021-11-28"), price:75})

db.Orders.insert({_id:22, custId:108, ordDate:new Date("2021-11-28"), price:25})

db.Orders.insert({_id:23, custId:108, ordDate:new Date("2021-11-29"), price:45})

db.Orders.insert({_id:24, custId:108, ordDate:new Date("2021-11-29"), price:25})

db.Orders.insert({_id:25, custId:108, ordDate:new Date("2021-11-29"), price:65})

db.Orders.insert({_id:26, custId:109, ordDate:new Date("2021-11-30"), price:75})

db.Orders.insert({_id:27, custId:109, ordDate:new Date("2021-11-30"), price:85})

db.Orders.insert({_id:28, custId:110, ordDate:new Date("2021-11-30"), price:15})

db.Orders.insert({_id:29, custId:110, ordDate:new Date("2021-11-30"), price:35})

db.Orders.insert({_id:30, custId:110, ordDate:new Date("2021-12-01"), price:55})


3.] Display All records in 'Orders'
db.Orders.find().pretty();


4.] Display Total Price of each Customer

var mapFun = function(){emit(this.custId, this.price);}

var reduceFun = function(keycustId, valuesPrices){return Array.sum(valuesPrices);}

db.Orders.mapReduce(mapFun, reduceFun, {out:"Result"})

db.Result.find()

5.] Display average Price of each Customer where ordDate is greater than 2021-11-19

db.Orders.mapReduce(
	function(){
		emit(this.custId, this.price);
	},
	function(key, values){
		return Array.avg(values)
	},
	{query:	{
		ordDate:{$gte:new Date("2021-11-19")
		}
	},
	out:"Result2"
	});

db.Result2.find().pretty();

6.] Display average price of customers whose custId is greater than 102.

db.Orders.mapReduce(function(){emit(this.custId, this.price);}, function(key, values){return Array.avg(values)}, {query:{custId:{$gt:102}}, out:"Result2"})

db.Result2.find().pretty();

7.] Display average price of customers whose custId is equal to 102.

db.Orders.mapReduce(function(){emit(this.custId, this.price);}, function(key, values){return Array.avg(values)}, {query:{custId:{$eq:102}}, out:"Result2"})

db.Result2.find().pretty();


db.Orders.drop();
db.Result.drop();
db.Result2.drop();
