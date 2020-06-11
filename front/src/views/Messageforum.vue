<template>

	<div id="getOne" class=" Messageforum justify" >
    <Head page='/#/zi-forum'/>
    <section class=" col-lg-10" v-for="item in info" :key="item.id">

      <div class="listForum">
        <button v-show="item.auteur == auteur || isadm == 'true'" @click="deletemsg" class="dbtna">x</button>
        <button v-show="item.auteur == auteur || isadm == 'true'" @click="seemodifier" class="dbtnm">modifier</button>
        <h2>{{ item.titre }} </h2>
        <p>Par : {{ item.auteur }}</p>
        <p>le: {{ item.quand }}</p>
        <p class="msgForum"> {{ item.message }} </p>
        <p><img :src="item.urlimg" class="imgMsg"></p>
        <p> </p>
         <form class="modifForum" enctype="multipart/form-data" id="formModifieur" v-show="seemodif">
            <input type="hidden" id="titre" name="titre" v-model="item.titre">
            <input type="hidden" id="salon" name="salon" v-model="salon">
            <input type="hidden" id="id_question" name="id_question" :value="id_question">
            <input type="hidden" id="auteur" name="auteur" v-model="auteur">
            <label> message : <textarea cols="30" id="message" name="message" v-model="message"> </textarea></label>
            <label> Fichier : <input type="file" id="file" name="file"> </label>
            <button @click="modifierForum"> Modifier</button>
          </form>
          
          <section class="reponseForum" v-for="res in resall" :key="res.id">
            <div class="listForum responseforum" >
              <p>Par : {{ res.auteur }} </p>
              <p>le: {{ res.quand }} </p>
              <p class="msgForum"> {{ res.message }} </p>
              <p><img :src="res.urlimg" class="imgMsg"></p>
              <p> </p>
            </div>
          </section>
          <section>
            <form class="repForum" enctype="multipart/form-data" id="formRepForum" v-if="master">
              <input type="hidden" id="salon" name="salon" v-model="salon">
              <input type="hidden" id="id_question" name="id_question" :value="id_question">
              <input type="hidden" id="auteur" name="auteur" v-model="auteur">
              <label> message : <textarea cols="30" id="message" name="message" v-model="message"> </textarea></label>
              <label> Fichier : <input type="file" id="file" name="file"> </label>
              <button @click="responseForum"> Répondre</button>
            </form>
          </section>
      </div>
    </section >
  </div>
     
</template>

<script>
import Head from '../components/Head'

export default {
  
  name: 'Messageforum',
  components:{
    Head,

    },
		data(){
			return{
				info : '',              
        id: '',
        id_question: '',
        token:'',
        urlimg:'',
        isadm:'',
        salon:'forum',
        seemodif: false,
        master: true,
        message:''
      }
    },
       
    methods:{
      modifierForum(e){
        e.preventDefault();
        let formModifieur = document.getElementById('formModifieur');
        let fdm = new FormData(formModifieur);
        console.log(fdm);
        this.axios.put('http://localhost:4040/api/forum/modifier',fdm,{
           headers:{
             "Authorization":"Bearer "+this.token
           }
         })
         .then(()=>{console.log('modifié'),location.reload()})
         .catch(error => {console.log(error)});
        },
      seemodifier(){
        this.seemodif = true;
        this.master = false;
      },
      responseForum(e){
          e.preventDefault();
          //récupération de l'id du message dans l'url
          let uri1 = document.location.href;
          console.log(uri1);
          let test = uri1.split('#')[1];
          console.log('test :' ,test);

          let url3 = new URL(test,'http://localhost');
          let id = url3.searchParams.get('id');
          console.log("avant post id :",id);
      
          this.id_question = id;
          let token = localStorage.getItem('token');
          console.log(token);
          let name = localStorage.getItem('email');
          console.log('name: ',name);
          let postreponse = document.getElementById('formRepForum');
          const fd = new FormData(postreponse);
         this.axios.post("http://localhost:4040/api/forum/reponse",fd,{
            headers:{
              "Authorization":"Bearer "+token,
              'Accept': 'application/json',
              'Content-Type': 'multipart/form-data'
            }
          })
          .then(() => {console.log('ok')})
          .catch(error => {console.log(error)});
        },
      deletemsg(){
          console.log('COUCOU');
          window.confirm('Etes vous sûr de vouloir effacer ce mesage?');
          let idm = this.id_question;
          console.log(idm);
          let token = localStorage.getItem('token');
          token;
          console.log('CLICKING !!')
          this.axios.delete('http://localhost:4040/api/forum/deleteone/'+idm,{
            headers:{
             "Authorization":"Bearer "+token
           }
         })
         .then(()=>{window.location.assign('http://localhost:8080/#/zi-forum')})
         .catch(error => {console.log(error)});
        },
    },
      mounted(){
        let isadm = localStorage.getItem('isadm');
        this.isadm = isadm;
        let nameAuteur = localStorage.getItem('email');
        this.auteur = nameAuteur;
        let token = localStorage.getItem('token');
        this.token = token;
        if(token == null){
          window.history.back();
          }
        //récupération de l'id du message dans l'url
        let uri1 = document.location.href;
        console.log(uri1);
        let test = uri1.split('#')[1];
        console.log('test :' ,test);

        let url3 = new URL(test,'http://localhost');
        let id = url3.searchParams.get('id');
        console.log(id);
      
        this.id_question = id;

        //requête get (auth) pour recupérer un message en fonction de l'id
        this.axios.get('http://localhost:4040/api/forum/post/'+id,{
          headers:{
            "Authorization":"Bearer "+token
          }
        })
        .then(response=>{
          this.info = response.data;
          console.log(response.data);
          })
          .catch(function (error) {console.log(error);
					})
					.then(function () {console.log('FINALY');});
        
          //requête post(auth) voir toutes les reponses d'un post choisi
        this.axios.post("http://localhost:4040/api/forum/reponse/all",{
          id_question : id
        },{
          headers:{
              "Authorization":"Bearer "+token
            }
        })
          .then(response => {
            console.log("resAll :",response );
            this.resall = response.data;
            console.log("resAll:" ,response.data)})
          .catch(error => {console.log(error)});
      } 
  }


</script>

<style lang="scss">
.repForum{
  padding: 1%;
  width: auto;
  border: 1px solid rgb(243, 226, 185);
  border-radius: 10px;
  background-color: rgb(248, 206, 193);
}
.imgMsg{
  max-width: 50%;
  background-origin: 2px solid white;
}
.dbtna{
	color: red;
  border-radius: 5px;
}
.dbtnm{
  border: blue;
  color: blue;
  background-color: rgb(153, 153, 248);
  border-radius: 5px;
  &d{
    background-color: rgb(187, 139, 231);
    color :blueviolet;
    border-radius: 5px;
  }
}
.modifForum{
  background-color:whitesmoke;
}
.responseforum{
  width: 100%;
}
</style>