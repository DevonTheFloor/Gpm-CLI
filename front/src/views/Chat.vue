<template>
<div >	
  <section class="justify-content-lg-center formForum chat"  id="message">
    <div v-for="tweet in chat" :key="tweet.id">
      <p>{{tweet.auteur}}</p>
      <p>{{tweet.quand}}</p>
      <p> {{tweet.message}}</p>
    </div>
  </section>

	<footer class="messrezo justify-content-lg-center">
    <div class="col-lg-12">
      <form action="http://localhost:4040/api/rezo/post" method="post" >
        <input type="hidden" id="auteur" name="auteur" :value="email">
        <label>Message: <textarea id="message" name="message" cols="50" v-model="message"></textarea></label>
        <button type="submit">Send</button>
      </form>
    </div>
  </footer>
	</div>
</template>

<script>
//import Header from '@/components/Header.vue'

export default {
	name: 'Chat',
	//components: Header,
	data(){
		return{
			chat:'',
			email: '',
			message:''
		}
	},
	mounted(){
    let token = localStorage.getItem('token');

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
</style>