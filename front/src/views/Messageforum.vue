<template>

	<div id="getOne" class=" Messageforum justify-content-lg-center " >
    <Head page='/#/zi-forum'/>
    <section class=" col-lg-10" v-for="item in info" :key="item.id">
      <div class="listForum" >
        <h2>{{ item.titre }} </h2>
        <p>Par : {{ item.auteur }}</p>
        <p>le: {{ item.quand }}</p>
        <p class="msgForum"> {{ item.message }} </p>
        <p><img :src="item.urlimg" class="imgMsg"></p>
        <p> </p>
          
          <section class="reponseForum" v-for="res in resall" :key="res.id">
            <div class="listForum" >
              <p>Par : {{ res.auteur }} </p>
              <p>le: {{ res.quand }} </p>
              <p class="msgForum"> {{ res.message }} </p>
              <p> </p>
            </div>
          </section>
          <section>
            <form class="repForum" enctype="multipart/form-data">
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
  components:{ Head},
		data(){
			return{
				info : '',
        resall: '',
        auteur : '',
        message : '',
        id: '',
        id_question: '',
        salon : "forum" ,
        token:''
      }
    },Computed(){
       
    },
    methods:{
      responseForum(e){
         e.preventDefault();
        //récupération de l'id du message dans l'url
        let uri1 = document.location.href;
        console.log(uri1);
        let test = uri1.split('#')[1];
        console.log('test :' ,test);

        let url3 = new URL(test,'http://localhost');
        let id = url3.searchParams.get('id');
        console.log(id);
      
        this.id_question = id;
          let token = localStorage.getItem('token');
          console.log(token);
          let name = localStorage.getItem('email');
          this.auteur = name;

          this.axios.post("http://localhost:4040/api/forum/reponse",{

            id_question : this.id_question,
            auteur : this.auteur,
            message : this.message,
            salon : this.salon
          },
          {
            headers:{
              "Authorization":"Bearer "+token
            }
          })
          .then(response => {console.log(response)})
          .catch(error => {console.log(error)});
          location.reload();
      }
      
    },
    mounted(){
        let nameAuteur = localStorage.getItem('email');
        this.auteur = nameAuteur;
        let token = localStorage.getItem('token');
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
          //id_question: this.id_question
          id_question : 14
        },{
          headers:{
              "Authorization":"Bearer "+this.token
            }
        })
          .then(response => {
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

</style>