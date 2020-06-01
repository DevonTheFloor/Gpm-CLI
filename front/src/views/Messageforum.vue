<template>
	<div id="getOne" class=" Messageforum justify-content-lg-center " >
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
export default {
	name: 'Messageforum',
		data(){
			return{
				info : '',
        resall: '',
        id_question: '',
        auteur : '',
        message : '',
        salon : "forum" 
      }
    },
    methods:{
      responseForum(){}
      
    },
    mounted(){
        let nameAuteur = localStorage.getItem('email');
        this.auteur = nameAuteur;
        let token = localStorage.getItem('token');
        //récupération de l'id du message dans l'url
        let params = new URLSearchParams(document.location.search);
        let uri1 = document.location.href;
        console.log(uri1);
        let test = uri1.split('#')[1];
        console.log('test :' ,test);
            console.log(params);
            let url3 = new URL(test,'http://localhost');
            let id = url3.searchParams.get('id');
            console.log(id);
        /*//
        let _id = params.get("id");
        //let _id = 14;
        console.log('id= ' + _id);
        this.id_question = _id;*/

        //requête get (auth) pour recupérer un message en fonction de l'id
        this.axios.get(`http://localhost:4040/api/forum/post/${this._id}`,{
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
        this.axios.post("http;//localhost:4040/api/forum/reponse/all",{
          //id_question: this.id_question
          id_question : 14
        },{
          headers:{
              "Authorization":"Bearer "+token
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

</style>