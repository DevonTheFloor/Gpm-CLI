<template>
	<div class="stat">
		<Head page="http://localhost:8080/#/vous-etes-ici"/>
		<section class="menuStat">
		<h1>Statistique </h1>
		<p>Liste des derniers messages des différents salons</p>
    <h2 class="menuStat">Forum :</h2>
		<div v-for="formsg in forst" :key="formsg.id" class="statp">
			<div><p><i> Auteur</i> : {{ formsg.auteur }} <i>Titre</i> : {{ formsg.titre }}  <img :src="formsg.urlimg" class="mini"></p></div> <div><Deletbtn/></div>
		</div>
		<h2 class="menuStat">Market place :</h2>
		<div v-for="makmsg in makst" :key="makmsg.id" class="statp">
			<div><p><i>De : </i> {{ makmsg.auteur }} <i>Categori : </i> <b>{{  makmsg.categorie }}</b> <i>titre : </i>{{  makmsg.titre }} <img :src="makmsg.urlimg" class="mini"></p></div><div><Deletbtn/></div>
		</div>
		<h2 class="menuStat">Chat :</h2>
		<div v-for="chmsg in chst" :key="chmsg.id" class="statp">
			<div><p> <i>De : </i> {{ chmsg.auteur }} <i> msg : </i> {{ chmsg.message }} </p> </div><div><Deletbtn/></div>
		</div>

    </section>
	</div>
</template>

<script>
import Deletbtn from '../components/Deletebtn'
import Head from '../components/Head'
export default {
	name: 'Statistic',
	components:{
		Deletbtn,
		Head
	},
	data(){
		return{
			chst: '',
			forst: '',
			makst: ''
		}
	},
	mounted(){

		let token = localStorage.getItem('token');

		this.axios.get('http://localhost:4040/api/forum/forumStat',{
			headers:{
				"Authorization":"Bearer "+token
			}
		})
		.then(res =>{
			this.forst = res.data;
			console.log("forst:",this.forst)
		})
		.catch(error =>{console.log(error)});

		this.axios.get('http://localhost:4040/api/market/marketStat',{
			headers:{
				"Authorization":"Bearer "+token
			}
		})
		.then(res =>{
			this.makst = res.data;
			console.log('makst :',this.makst)
		})
		.catch(error =>{console.log(error)});

				this.axios.get('http://localhost:4040/api/rezo/chatStat',{
			headers:{
				"Authorization":"Bearer "+token
			}
		})
		.then(res => {
			this.chst = res.data;
			console.log("chst:", this.chst);
		})
		.catch(error =>{console.log(error)});
	}
}
</script>

<style lang="scss">
.menuStat{
	border: 1px solid grey;
	background-color: beige;
	box-shadow: 2px 2px 2px 2px white;
}
.statp{
	border: 2px solid rgb(237, 240, 80);
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}
.mini{
	max-width: 5%;
}
</style>