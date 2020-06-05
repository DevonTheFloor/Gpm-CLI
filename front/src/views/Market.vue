<template>

<div v-if="visible" class="market">
	<Head page='/#/vous-etes-ici'/>
	<section  class=" col-lg-6 of formForum"  v-for="article in annonce" :key="article.id">
    <div class="listForum">
	<Deletebtn v-if="article.auteur == auteur"/>
	<button class="dbtna" v-if="isadm == 'true'" @click="deletemsg">x</button>
  <a  href="/api/market/post/:id"><h4> {{article.titre}} </h4></a>
		<p>par: {{ article.auteur }}</p>
      <p> {{ article.annonce}} </p>
      <img class="picmarket" :src="article.urlimg">
    </div>
  </section>
	</div>
</template>

<script>
import Head from '../components/Head'
import Deletebtn from '../components/Deletebtn'
export default {
	name: 'Market',
	components:{
		Head,
		Deletebtn
	},
	data(){
		return{
			visible: true,
			annonce: '',
			auteur:''

		}
	},
	mounted(){
		let nameauteur = localStorage.getItem('email');
		this.auteur = nameauteur;
		let token = localStorage.getItem('token');
		this.axios.get("http://localhost:4040/api/market/all",{
			headers:{
				"Authorization":"Bearer "+token
				}
			})
			.then(response => {
			this.annonce = response.data,
			console.log(response.data)
			})
			.catch(error =>{console.log(error)});
			}
}
</script>

<style lang="scss">
.picmarket {
  width: 50%;
  border:2px solid black;
  box-shadow: 3px 3px 3px grey;
}
.imgMsg{
  max-width: 50%;
  background-origin: 2px solid white;
}
.listForum{
  border: 4px solid grey;
  background-color: beige;
  width: 90%;
  padding: 1%;
  margin: 1%;
}
</style>