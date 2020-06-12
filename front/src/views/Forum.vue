<template>
  
    <div class="forum justify" >
      <Head page="/#/vous-etes-ici"/>
      <!-- formulaire pour poster un message dans le forum -->
      <form v-show="seen" enctype="multipart/form-data" id="formpost" class="designform">
        <input type="hidden" id="auteur" name="auteur" :value="auteur">
        <label for="titre">Titre : </label> <input type="text" id="titre" name="titre" v-model="titre"> 
        <label for="message">Message : </label> <textarea id="message" name="message" v-model="message" cols="200"></textarea> 
        <input type="file" id="file" @change="onFileSelected"/>
        <button @click="poster">FORUMER !</button>
      </form>
  
    <section v-if="seeAll">
      <button id="postforum" @click="seeform">Poster un message</button>
      <!-- affichage de tous les message du forum -->
      <div class="listForum" v-for="item in info" :key="item.id">
        <a :href="'http://localhost:8080/#/voir-un-message?id='+item._id"><h2> {{ item.titre }} </h2></a>
        <p>par:  {{ item.auteur }} </p>
        <p> {{ item.message }} </p>
     </div>
    </section>
   
  </div>
</template>

<script>

import Head from '../components/Head.vue'

export default {
    name: 'Forum',
    components:{
      Head,
    } ,
    data(){
      return{
        info: '',
        seen: false,
        seeAll: true,
        email: '',
        mdp:'',
        titre:'',
        message:'',
        auteur:''
      }
    },

		methods:{
      onFileSelected(e){
        this.selectedFile = e.target.files[0];
      },
			seeform(){
          this.seen = true;
          this.seeAll = false
      },
      poster(e){
        e.preventDefault();
        let token = localStorage.getItem('token');
        let email = localStorage.getItem('email');
        console.log(email);
        let formpost = document.getElementById('formpost')
        let fd = new FormData(formpost);
        /**
         * requête POST pour poster un message dans le forum
         */
        this.axios.post("http://localhost:4040/api/forum/post",fd,
          {
            headers:{
              "Authorization":"Bearer "+token,
              'Content-Type': 'multipart/form-data'
            }
          })
          .then(response =>{console.log(response)})
          .catch(error => {console.log(error)});
          location.reload(); 
        }
    },
    mounted(){
      let auteur =localStorage.getItem('email');
      this.auteur = auteur;
      let token = localStorage.getItem('token');
      if(!token){
				window.history.back();
			}
      console.log("tokenStorage: ",token);
      var config = {
      headers: { 
          "Authorization":"Bearer "+token
        }
      };
      /**
       * GET recupère tous les post du forum
      */
       this.axios.get('http://localhost:4040/api/forum/posts',  config)
      .then((response) => {
      this.info = response.data,
      console.log(response)
      })
      .catch(error => console.log(error));
      } 
	}

</script>

<style lang="scss">
.listForum{
  align-items: flex-start;
  border: 4px solid grey;
  background-color: beige;
  width: 80%;
  padding: 1%;
  margin: 1%;
}
.msgForum{
  border: 2px solid rgba(255, 255, 255, 0.794);
  background-color: rgb(248, 248, 241);
  border-radius: 10px;
  padding: 1%;
  margin: 1%;
}

</style>