const mysql = require('mysql');
const connectdb = require('../queries/connectdb');

/*exports.statForum = (req,res,next)=>{
	console.log("Connecté FORUM Admin getAll !!");
	var qy1 = "SELECT * FROM forum ORDER BY quand DESC LIMIT 5 ";
	connectdb.query(qy1, function(err,result){
			if (err) throw err ;
			console.log(result);
			res.status(200).json(result);
			});
};
/*
exports.getAll = (req,res,next)=>{
	console.log("Connecté mySQL on getAll !!");
	var qy1 = "SELECT * FROM rezo ORDER BY quand DESC LIMIT 5 ";
	connectdb.query(qy1, function(err,result){
			if (err) throw err ;
			console.log(result);
			res.status(200).json(result);
			});
};


exports.statMarket = (req,res,next)=>{
	console.log("Connecté mySQL on getAll !!");
	var qy1 = "SELECT * FROM market ORDER BY quand DESC LIMIT 5 ";
	connectdb.query(qy1, function(err,result){
			if (err) throw err ;
			console.log(result);
			res.status(200).json(result);
			});
};*/