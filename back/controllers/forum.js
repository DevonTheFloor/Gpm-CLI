const mysql = require('mysql');
const connectdb = require('../queries/connectdb');

exports.postOne = (req,res,next)=>{

    console.log("Connecté mySQL PostOne !!");
    if(req.file){
        let titre = req.body.titre;
        let auteur= req.body.auteur;
        let message = req.body.message;
        let urlimg = "http://localhost:4040/api/images/dl/"+req.file.filename;

        var sql = "INSERT INTO forum (titre,auteur,message,urlimg,quand) VALUES(?,?,?,?,NOW())";
        var inserts = [titre,auteur,message,urlimg];
        sql = mysql.format(sql,inserts);
        connectdb.query(sql, function(err,result){
            if (err) throw err ;
            console.log("Message posté");
            res.redirect("http://localhost:8080/#/zi-forum");
        });
    } else {
        let titre = req.body.titre;
        let auteur= req.body.auteur;
        let message = req.body.message;

        var sql = "INSERT INTO forum (titre,auteur,message,quand) VALUES(?,?,?,NOW())";
        var inserts = [titre,auteur,message];
        sql = mysql.format(sql,inserts);
        connectdb.query(sql, function(err,result){
            if (err) throw err ;
            console.log("Message posté");
            res.redirect("http://localhost:8080/#/zi-forum");
        });
    }
  
}

exports.getAll = (req,res,next)=>{

    console.log("Connecté mySQL on getAll !!");
    var qy1 = "SELECT * FROM forum";
    connectdb.query(qy1, function(err,result){
        if (err) throw err ;
        console.log(result);
        res.status(200).json(result);
        });
}

exports.getOne = (req,res,next)=>{

    let _id = req.params.id;
    //let _id=14;
    console.log("id = ",_id);
 
    console.log("Connecté mySQL on GetOne !!");
    var sql = "SELECT * FROM forum WHERE _id=?";

    var inserts = [_id];
    sql = mysql.format(sql,inserts);
    connectdb.query(sql, function(err,result){
        if (err) throw err ;
        console.log("Connexion ok");
        res.status(200).json(result);
        console.log("result = ",result);
    });
}

exports.resForum = (req,res,next)=>{

    console.log("Connecté REPONSE forum!!");
    if(req.file){
        console.log('connection avec IMG');
        let auteur= req.body.auteur;
        let message = req.body.message;
        let urlimg = "http://localhost:4040/api/images/dl/"+req.file.filename;
        let id_question = req.body.id_question;
        let salon = req.body.salon;
    
        //var sql = "INSERT INTO reponse VALUES(NULL,?,?,?,?,?,NOW())";
        var sql = "INSERT INTO reponse (auteur,message,urlimg,id_question,salon,quand) VALUES(?,?,?,?,?,NOW()))";
        var inserts = [auteur,message,urlimg,id_question,salon];
        sql = mysql.format(sql,inserts);
        connectdb.query(sql, function(err,result){
            if (err) throw err ;
						console.log("Reponse posté");
						res.redirect('http:/localhost:8080/#/voir-un-message'+id_question);
        });
    }else{
        console.log('connecté response sans IMG');
        let auteur= req.body.auteur;
        let message = req.body.message;
        let id_question = req.body.id_question;
        let salon = req.body.salon;
        console.log('salon :',salon);
        console.log('id_question',id_question);
        //var sql = "INSERT INTO reponse VALUES(NULL,?,?,?,?,NOW())";
        var sql = "INSERT INTO reponse (auteur,message,id_question,salon,quand) VALUES(?,?,?,?,NOW())";
        var inserts = [auteur,message,id_question,salon];
        sql = mysql.format(sql,inserts);
        connectdb.query(sql, function(err,result){
            if (err) throw err ;
            console.log("Reponse posté");
            res.redirect('http:/localhost:8080/#/voir-un-message'+id_question);
        });
    }
}

exports.getAllRes = (req,res,next)=>{

    console.log("Connecté mySQL on Xampp !!");
		console.log("reponse forum linked");
        //let id_question = req.body.id_question;
        let id_question = req.body.id_question;
		var sql = "SELECT * FROM reponse WHERE salon='forum' AND id_question=? ";
		var inserts = [id_question];
		sql = mysql.format(sql,inserts);
    connectdb.query(sql, function(err,result){
        if (err) throw err ;
        console.log(result);
        res.status(200).json(result);
        });
};
