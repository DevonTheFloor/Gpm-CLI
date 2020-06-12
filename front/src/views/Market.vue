<template>
<div class="market justify">
	<Head page="http://localhost:8080/#/vous-etes-ici"/>
	<nav class="menuMarket">
    <ol>
      <li class="classeur" @click="affAuto">Auto</li>
      <li class="classeur" @click="affMaison">Maison</li>
      <li class="classeur" @click="affInfo">Informatique</li>
      <li class="classeur" @click="affAutre">Autre</li>
    </ol>
  </nav>

  <button id="addAnnonce" @click="seeForm">Poster une annonce</button>
<!-- affichage des mannonces du market place -->
	<div v-show="visible" class="showbloc" >
		<section  v-for="article in annonces" :key="article.id">
    <div class="listForum">
			<a  :href="'http://localhost:8080/#/voir-une-annonce?id='+article._id"><h4> {{article.titre}} </h4></a>
			<p>par: {{ article.auteur }}</p>
      <p> {{ article.annonce}} </p>
    </div>
    </section>
	</div>
	<!-- formulaire pour poster une annonce -->
	<section class="justify-content-lg-center">
		<form enctype="multipart/form-data"  id="postannonce" v-show="seen" class="designform">
			<input type="hidden" id="auteur" name="auteur" :value="auteur">
			<label for="titre"> Titre : </label><input type="text" id="titre" name="titre" v-model="titre"/>
			<label for="annonce"> Annonce :</label><textarea id="annonce" name="annonce" ></textarea>
			<label for="categorie"> Catégorie :   </label>
        <select id="categorie" name="categorie" v-model="categorie">
          <option value="auto ">Auto</option>
          <option value="maison">Maison</option>
          <option value="infor">Informatique</option>
          <option value="autre">Autre</option>
        </select> 
			<label for="file"> Photo: </label><input type="file" id="file" name="file"/>
			<button @click="annoncer"> Annoncer !</button>
		</form>
	</section>
</div>
</template>

<script>
import Head from '../components/Head'

export default {
	name: 'Market',
	components:{
		Head,

	},
	data(){
		return{
			visible: true,
			seen: false,
			annonce: '',
			annonces:'',
			categorie:'',
			auteur:'',
			//email:'',
			titre:'',
			isadm:'',
			idm:'',
			token:'',
			article:''

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
			/**
			 * requête POST pour poster une annonce dans le market place
			 */
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
		/**
		 * affchage de la categorie auto dans la liste de market place
		 */
		affAuto(){
			this.axios.post("http://localhost:4040/api/market/classeur",{
				categorie:"auto"
			},{
			headers:{
				"Authorization":"Bearer "+this.token
				}
			})
			.then(response => {
			this.annonces = response.data,
			console.log(response.data)
			})
			.catch(error =>{console.log(error)});
		},
		/**
		 * affiche de la categorie informatique du market place
		 */
		affInfo(){
			this.axios.post("http://localhost:4040/api/market/classeur",{
				categorie:"infor"
			},{
			headers:{
				"Authorization":"Bearer "+this.token
				}
			})
			.then(response => {
			this.annonces = response.data,
			console.log(response.data)
			})
			.catch(error =>{console.log(error)});
		},
		/**
		 * affichege de la categorie maison du market place
		 */
		affMaison(){
			this.axios.post("http://localhost:4040/api/market/classeur",{
				categorie:"maison"
			},{
			headers:{
				"Authorization":"Bearer "+this.token
				}
			})
			.then(response => {
			this.annonces = response.data,
			console.log(response.data)
			})
			.catch(error =>{console.log(error)});
		},
		/**
		 * affichage de la categorie autre du market place
		 */
		affAutre(){
			this.axios.post("http://localhost:4040/api/market/classeur",{
				categorie:"autre"
			},{
			headers:{
				"Authorization":"Bearer "+this.token
				}
			})
			.then(response => {
			this.annonces = response.data,
			console.log(response.data)
			})
			.catch(error =>{console.log(error)});
		}

	},
	mounted(){
		//recuêration de variables dans le local storage
		let isadm = localStorage.getItem('isadm');
		this.isadm= isadm;
		let email = localStorage.getItem('email');
		this.auteur = email;
		let token = localStorage.getItem('token');
		this.token = token;
			if(!token){
				window.history.back();
			}
			/**
			 * requête GET pour récupérer tous les messages du market place
			 */
		this.axios.get("http://localhost:4040/api/market/all",{
			headers:{
				"Authorization":"Bearer "+token
				}
			})
			.then(response => {
			this.annonces = response.data,
			this.annonceId = response.data._id,
			console.log('anId :', response.data._id),
			console.log(response.data)
			})
			.catch(error =>{console.log(error)});
			}
}
</script>

<style lang="scss">

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
	width: 100%;
}
.menuMarket{
  border: 2px solid grey;
  background-color: beige;
  color:red;
	width: 100%;
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
.market{
	width: 100%;
}
.showbloc{
	width: 90%;
	display: flex;
	align-items: center;
	flex-direction: column;
}
.classeur{
	cursor: pointer;
}

</style>