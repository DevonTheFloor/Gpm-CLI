const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const mysql = require('mysql');
const connectdb = require('../queries/connectdb');


  exports.signup = (req,res,next)=>{
  
    console.log("reqBody dans connect = ",req.body);
    let email = req.body.email;
    let mdp = req.body.mdp;
    let isadm = req.body.isadm;
    bcrypt.hash(mdp,10).then(hash => {
          email = email;
          mdp = hash;
          isadm = false; 

          console.log("Connecté mySQL on Xampp !!");
          var sql = "INSERT INTO users (email,mdp,isadm) VALUES(?,?,?)";
          var inserts = [email,hash,isadm];
          sql = mysql.format(sql,inserts);
          connectdb.query(sql, function(err,result){
              if (err) throw err ;
              console.log("Utilisateur ajouté");
              res.status(200).json({message:"compte créé, merci de vous connecter avec vos identifiants"});
          });
    });
  }

  exports.login = (req,res,next)=>{

    console.log("Connected DBs for login");
    let email = req.body.email;
    //let mdp =req.body.mdp;
    var sql = "SELECT _id,email,mdp,isadm FROM users WHERE email=?";
    var inserts = [email];
    sql = mysql.format(sql,inserts);
    connectdb.query(sql,function(err,result){
      if (err) throw err;
      console.log(typeof(result));
      console.log(result);
      console.log(req.body.mdp);
      console.log("tablo: ",result);
      result.forEach(elemt =>{
        console.log("elmt.mdp :",elemt.mdp);
        bcrypt.compare(req.body.mdp,elemt.mdp ).then(valid =>{
          console.log("mdp=",req.body.mdp);
          console.log("elemtmdp =",elemt.mdp);
          if (!valid) {
            return res.status(401).json({ error: 'Mot de passe incorrect !' });
        }else {
          res.status(200).json({email: elemt.email,isadm: elemt.isadm,idu: elemt._id,
            token: jwt.sign({ email: elemt.email },'RANDOM_TOKEN_SECRET',{ expiresIn: '24h' })
          })
        }
      })
      .catch(error => res.status(500).json({message:"probleme de cryptage du token"}));
    });
  })
}

exports.deluser = (req,res,next)=>{

  let id = req.params.id;
  console.log('id :',id);
  var sql = "DELETE FROM users WHERE _id=?";
  var inserts = [id];
  sql = mysql.format(sql,inserts);
  connectdb.query(sql, function(err,result){
      if (err) throw err ;
      console.log("COMPTE SUPPRIME");
      res.status(200).json({message:"Utilisateur supprimé"});
  });
};