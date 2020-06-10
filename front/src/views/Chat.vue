<template>
<div >	
  <Head class="headchat" page="http://localhost:8080/#/vous-etes-ici"/>
  <section class="justify-content-lg-center formForum chat"  id="message">
    <div v-for="tweet in chat" :key="tweet.id">
      <p>{{tweet.auteur}}</p>
      <p>{{tweet.quand}}</p>
      <p> {{tweet.message}}</p>
    </div>
  </section>

	<footer class="messrezo justify-content-lg-center">
    <div class="col-lg-12">
     <form enctype="multipart/form-data"  id="chating">
        <input type="hidden" id="auteur" name="auteur" :value="email">
        <label>Message: <textarea id="message" name="message" cols="50" v-model="message"></textarea></label>
        <button @click="chater">Chatez !</button>
      </form>

        <!--<form action="http://localhost:4040/api/rezo/post" method="POST" enctype="multipart/form-data" id="chating">
        <input type="hidden" id="auteur" name="auteur" value="Joe">
        <label>Message: <textarea id="message" name="message" value="un message cool" cols="50"></textarea></label>
        <button type="submit">form data</button>
      </form>-->
    </div>
  </footer>
	</div>
</template>

<script>
import Head from '../components/Head'
export default {
  name: 'Chat',
  components:{
    Head
  },

	data(){
		return{
			chat:'',
			email: '',
      message:'',
      token:''
		}
  },
  methods:{
    /**
     * reque pour poster un message dans le chat
     */
    chater(e){
    e.preventDefault();
    this.axios.post('http://localhost:4040/api/rezo/post',{
      auteur: this.email,
      message: this.message
    },{
      headers:{
          "Authorization":"Bearer "+this.token,
          "Content-type":"application/json"
      }
    })
    .then(setTimeout(function(){window.location.reload() },1000))
    .catch(error =>{console.log(error)});
  }
  }
  ,
	mounted(){
    let email = localStorage.getItem('email');
    this.email = email;
    let token = localStorage.getItem('token');
    this.token = token;
    if(token == null){
      window.history.back();
      }

    this.axios.get("http://localhost:4040/api/rezo/posts",{
      headers:{
        "Authorization":"Bearer "+token
        }
      })
      .then(response => {
        this.chat = response.data
        console.log(response.data)})
      .catch(error => {console.log(error)});
    }
}
</script>

<style lang="scss">
.chat{
  border: 3px solid grey;
  background-color: gainsboro;
  margin-bottom: 10%;
  position: fixed;
  top:100px;
  max-height: 70%;
  min-width: 85%;
  overflow: scroll;
}
.messrezo{
	min-width: 80%;
  position: fixed;
  bottom: 0px;
}
#message{
	width: 70%;
}
.headchat{
  margin: 5px;
}
</style>