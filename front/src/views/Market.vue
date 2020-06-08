<template>
<div class="market">
	<Head page="http://localhost:8080/#/vous-etes-ici"/>
	<nav class="menuMarket">
    <ol>
      <li>Auto</li>
      <li>Maison</li>
      <li>Informatique</li>
      <li>Autre</li>
    </ol>
  </nav>

  <button id="addAnnonce" @click="seeForm">Poster une annonce</button>
	<div v-show="visible" class="market">
		<section  class="clo-lg-8 "  v-for="article in annonce" :key="article.id">
    <div class="listForum">
			<Deletebtn v-if="article.auteur == auteur"/>
			<button class="dbtna" v-if="isadm == 'true' || email == article.auteur" @click="deletemsg">x</button>
			<a  href="/api/market/post/:id"><h4> {{article.titre}} </h4></a>
			<p>par: {{ article.auteur }}</p>
      <p> {{ article.annonce}} </p>
			<img class="picmarket" :src="article.urlimg">
    </div>
    </section>
	</div>

	<section class="justify-content-lg-center">
		<form enctype="multipart/form-data"  id="postannonce" v-show="seen">
			<input type="hidden" id="auteur" name="auteur" :value="email">
			<label> Titre : <input type="text" id="titre" name="titre" v-model="titre"/></label>
			<label> Annonce :<textarea id="annonce" name="annonce" ></textarea></label>
			<label> Catégorie : 
        <select id="categorie" name="categorie" v-model="categorie">
          <option value="auto ">Auto</option>
          <option value="maison">Maison</option>
          <option value="infor">Informatique</option>
          <option value="autre">Autre</option>
        </select> 
      </label>
			<label> Photo: <input type="file" id="file" name="file"/></label>
			<button @click="annoncer"> Annoncer !</button>
		</form>
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
			seen: false,
			annonce: '',
			categorie:'',
			auteur:'',
			email:'',
			titre:'',
			isadm:'',
			token:''
		}
	},
	methods:{
		seeForm(){
			this.visible = false;
			this.seen = true;
		},
		annoncer(e){
			e.preventDefault();
			let annoncer = document.getElementById('postannonce');
			let email = localStorage.getItem('email');
			this.auteur = email;
			let fd = new FormData(annoncer);
			console.log("CLICK!")
			this.axios.post("http://localhost:4040/api/market/post",fd,{
			headers:{
				"Authorization":"Bearer "+this.token
				}
			})
			.then(response => {
			this.annonce = response.data,
			console.log(response.data),
			window.location.reload();
			})
			.catch(error =>{console.log(error)});
		},
		deletemsg(){}
	},
	mounted(){
		let isadm = localStorage.getItem('isadm');
		this.isadm= isadm;
		let email = localStorage.getItem('email');
		this.auteur = email;
		let token = localStorage.getItem('token');
		this.token = token;
			if(token == null){
				window.history.back();
			}
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
.menuMarket{
  border: 2px solid grey;
  background-color: beige;
  color:red;
}
ol{
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	list-style: none;
}
.dbtna{
	color: red;
	background-color: rgb(240, 197, 118);
	border: 1px solid red;
}
</style>