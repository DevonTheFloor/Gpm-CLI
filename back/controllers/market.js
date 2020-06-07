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
          res.redirect("http://localhost:8080/#/market-place");
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

  exports.statMarket = (req,res,next)=>{
    console.log("Connecté mySQL on getAll !!");
	  var qy1 = "SELECT * FROM market ORDER BY quand DESC LIMIT 5 ";
	  connectdb.query(qy1, function(err,result){
			if (err) throw err ;
			console.log(result);
			res.status(200).json(result);
			});
  };