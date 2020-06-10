<template>
	<div class="annonce">
		<Head page='/#/market-place'/>
			<section class="listForum annonceone">
				<div v-for="item in annonce" :key="item.id">
					<button class="dbtna" v-if="isadm == 'true' || email == annonce.auteur" @click="deletemsg">x</button>
					<h2> {{ item.titre }} </h2>
					<p> {{ item.annonce }} </p>
					<p><img :src="item.urlimg" class="picMarket"></p>
				</div>
			</section>
	</div>
</template>

<script>
import Head from '../components/Head'

export default {
	name: 'Annonce',
	components:{
		Head
	},
	data(){
		return{
			annonce:'',
			isadm:'',
			token:'',
			id:''
		}
	},
	methods:{
		deletemsg(){
			console.log('COUCOU');
			window.confirm('Etes vous sûr de vouloir effacer ce mesage?');
			console.log('THIS: ',this.id);
			console.log('CLICKING !!');
			
      this.axios.delete('http://localhost:4040/api/market/deleteone/'+this.id,{
        headers:{
          "Authorization":"Bearer "+this.token
          }
        })
        .then(()=>{window.location.assign('http://localhost:8080/#/market-place')})
        .catch(error => {console.log(error)});
      }
	},
	mounted(){
		console.log('MOUNTED !!');
		let isadm = localStorage.getItem('isadm');
    this.isadm = isadm;
    let token = localStorage.getItem('token');
    this.token = token;
    if(token == null){
      window.history.back();
      }
    //récupération de l'id du message dans l'url
    let uri1 = document.location.href;
    console.log(uri1);
    let test = uri1.split('#')[1];
    console.log('test :' ,test);

    let url3 = new URL(test,'http://localhost');
		let id = url3.searchParams.get('id');
		this.id = id;
		console.log(id);

    //requête get (auth) pour recupérer une annonce en fonction de l'id
    this.axios.get('http://localhost:4040/api/market/see/'+id,{
      headers:{
        "Authorization":"Bearer "+token
        }
      })
      .then(response=>{
        this.annonce = response.data;
        console.log(response);
        })
        .catch(function (error) {console.log(error);
				})
				.then(function () {console.log('FINALY');});
	}
}
</script>

<style lang="scss">
.annonce{
	width: 100%;
}
.annonceone{
	width: 70%;
}
</style>