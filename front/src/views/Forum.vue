<template>
  
  <!--<div id="messagesForum" class="forum  justify-content-lg-center " >-->
    <div class="forum" >
      <Head page="/#/vous-etes-ici"/>
      <Login/>
      <form v-if="seen" enctype="multipart/form-data">
        <input type="hidden" id="auteur" name="auteur" :value="email">
        <label>Titre : <input type="text" id="titre" name="titre" v-model="titre"> </label>
        <label>Message : <textarea id="message" name="message" v-model="message"></textarea> </label>
        <input type="file" id="file" name="file">
        <button @click="poster">POSTER</button>
      </form>
  
    <section v-if="seeAll">
      <button id="postforum" @click="seeform">Poster un message</button>

      <div class="listForum" v-for="item in info" :key="item.id">
        <button >X</button>
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
      Head
    } ,
    data(){
      return{
        info: '',
        seen: false,
        seeAll: true,
        email: '',
        mdp:'',
        titre:'',
        message:''
      }
    },

		methods:{
			seeform(){
          this.seen = true;
          this.seeAll = false
        },
        poster(e){
          e.preventDefault();
          let token = localStorage.getItem('token');
          let email = localStorage.getItem('email');

          this.axios.post("http://localhost:4040/api/forum/post",{
             titre: this.titre,
             auteur: email,
             message : this.message
           },{
             headers:{
               "Authorization":"Bearer "+token
             }
           })
           .then(response =>{console.log(response)})
           .catch(error => {console.log(error)});
           location.reload(); 
        }
    },
    mounted(){

      let token = localStorage.getItem('token');
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
  width: 70%;
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