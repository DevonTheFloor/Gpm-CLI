<template>
	<div class="stat justify">
		<Head page="http://localhost:8080/#/vous-etes-ici"/>
		<section class="menuStat">
			<h1>Statistique </h1>
			<p>Liste des derniers messages des différents salons</p>
			<h2 class="menuStat"> Forum :</h2>
			<div v-for="formsg in forst" :key="formsg.id" class="statp">
			<div><p>n°: {{ formsg._id }} <i> Auteur</i> : {{ formsg.auteur }} <i>Titre</i> : {{ formsg.titre }}  <img :src="formsg.urlimg" class="mini"></p></div> <div> <a :href="'http://localhost:8080/#/voir-un-message?id='+formsg._id" target="_blank"><button class="voir">voir</button></a>  </div>
			</div>
			<h2 class="menuStat">Market place :</h2>
			<div v-for="makmsg in makst" :key="makmsg.id" class="statp">
			<div><p>n°: {{ makmsg._id }} <i>De : </i> {{ makmsg.auteur }} <i>Categori : </i> <b>{{  makmsg.categorie }}</b> <i>titre : </i>{{  makmsg.titre }} <img :src="makmsg.urlimg" class="mini"></p></div><div> <a :href="'/#/voir-une-annonce?id='+makmsg._id" target="_blank"><button class="voir" >voir</button></a> </div>
			</div>
			<h2 class="menuStat">Chat :</h2>
			<div v-for="chmsg in chst" :key="chmsg.id" class="statp">
			<div><p>n°: {{ chmsg._id }} <i>De : </i> {{ chmsg.auteur }} <i> msg : </i> {{ chmsg.message }} </p> </div><div><a href="/#/chat-live" target="_blank"><button class="voir">voir</button></a></div>
			</div>
		</section>
	</div>
</template>

<script>
import Head from '../components/Head'
export default {
	name: 'Statistic',
	components:{

		Head
	},
	data(){
		return{
			chst: '',
			forst: '',
			makst: ''
		}
	},
	methods:{
		delmsgforum(){
			let formsg = this.forst;
			let idm = formsg._id;
			console.log(idm);},
		delmsgmarket(){},
		delmsgchat(){}
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
.dbtn{
	color: red;
	background-color: rgb(245, 161, 161);
	border: 1px solid red;
	&:hover{
		background-color:rgb(204, 117, 59) ;
	}
}
.voir{
	background-color: whitesmoke;
	&:hover{
		background-color: wheat;
	}
}
.stat{
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-items: center;

}
</style>