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
      <form id="chating">
        <input type="hidden" id="auteur" name="auteur" :value="email">
        <label>Message: <textarea id="message" name="message" cols="50" v-model="message"></textarea></label>
        <button @click="chater">Chatez !</button>
      </form>
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
    chater(e){
    e.preventDefault();
    let chating = document.getElementById('chating');
    let fd = new FormData(chating);
    console.log('fd :',fd);

    this.axios.post('http://localhost:4040/api/rezo/post',fd,{
      headers:{
          "Authorization":"Bearer "+this.token
      }
    })
    .then(()=>{console.log(this.message)})
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