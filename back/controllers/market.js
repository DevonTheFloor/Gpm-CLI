const mysql = require('mysql');
const connectdb = require('../queries/connectdb');
const multer = require('multer');
const fs = require('fs');
const path = require('path');


exports.getAll = (req,res,next)=>{
    console.log("Connecté mySQL on Xampp !!");
      var qy1 = "SELECT * FROM market";
      connectdb.query(qy1, function(err,result){
          if (err) throw err ;
          console.log(result);
          res.status(200).json(result);
          });
  }

exports.postOne = (req,res,next)=>{
   
  if(req.file){
    let auteur = req.body.auteur;
    let urlimg = "http://localhost:4040/api/images/dl/"+req.file.filename;
    let categorie = req.body.categorie;
    let annonce = req.body.annonce;
    let titre = req.body.titre;
    console.log("req.body = ",req.body);
    console.log("Connecté mySQL on Xampp !!");
    var inserts = [auteur,titre,categorie,annonce,urlimg];
      var sql = "INSERT INTO market (auteur,titre,categorie,annonce,urlimg,quand) VALUES(?,?,?,?,?,NOW())";
     
      sql = mysql.format(sql,inserts);
      connectdb.query(sql, function(err,result){
          if (err) throw err ;
          console.log("Article mit en vente");
          res.status(201).json({message:"ressource créée"});
      });
    }else{
      let auteur = req.body.auteur;
      let categorie = req.body.categorie;
      let annonce = req.body.annonce;
     let titre = req.body.titre;
      console.log("req.body = ",req.body);
      console.log("Connecté mySQL on Xampp !!");
      var inserts = [auteur,titre,categorie,annonce];
      var sql = "INSERT INTO market (auteur,titre,categorie,annonce,quand) VALUES(?,?,?,?,NOW())";
      sql = mysql.format(sql,inserts);
      connectdb.query(sql, function(err,result){
          if (err) throw err ;
          console.log("Article mit en vente");
          //res.redirect("http://localhost:8080/#/market-place");
          res.status(202).json({message:"annoncement created"});
      });
    }
  }

exports.getOne = (req,res,next)=>{
  let _id = req.params.id;
  console.log("id = ",_id);
  console.log("Connecté mySQL on GetOneMarket !!");
  var sql = "SELECT * FROM market WHERE _id=?";
  var inserts = [_id];
  sql = mysql.format(sql,inserts);
  connectdb.query(sql, function(err,result){
    if (err) throw err ;
    console.log("annonce trouvée");
    res.status(200).json(result);
    console.log("result = ",result);
    });
}

exports.selectCat = (req,res,next)=>{
  let categorie = req.body.categorie;
  console.log("OK KAT");
  console.log("cat = ",categorie);
  console.log("Connecté mySQL on getAuto!!");
  var sql = "SELECT * FROM market WHERE categorie=?";
  var inserts = [categorie];
  sql = mysql.format(sql,inserts);
  connectdb.query(sql, function(err,result){
    if (err) throw err ;
    console.log("annonces classée par categorie trouvée");
    res.status(200).json(result);
    console.log("result = ",result);
    });
}

exports.deleteOne = (req,res,next)=>{

  console.log("Connect DeleteOneMarket");
  let id_message = req.params.id;
  var sql = "DELETE FROM market WHERE _id=?";
  var inserts = [id_message];
  sql = mysql.format(sql,inserts);
  connectdb.query(sql,function(err,result){
    if (err) throw err ;
   	console.log("delete on");
    res.status(200).json({message:"post deleted"});
  });
}

exports.statMarket = (req,res,next)=>{
  console.log("Connecté mySQL on getAll !!");
	var qy1 = "SELECT * FROM market ORDER BY quand DESC LIMIT 7 ";
	connectdb.query(qy1, function(err,result){
		if (err) throw err ;
		console.log(result);
		res.status(200).json(result);
		});
};