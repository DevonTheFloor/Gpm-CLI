<template>
	<div class="deletuser">
		<button class="deluse" @click="deletuser"> Supprimer ce compte</button>
	</div>
</template>

<script>
export default {
	name: 'Deletuser',
	data(){
		return{
		}
	},

	methods:{
		deletuser(){
			window.confirm('Etes vous sûr de vouloir effacer ce compte?\n Cette action est irreversible!');
			let idu = localStorage.getItem('idu');
			console.log('idu :',idu);
			let token = localStorage.getItem('token');
			

			this.axios.delete('http://localhost:4040/api/auth/deleteuser/'+idu,
			{
				headers:{
					"Authorization":"Bearer "+token
				}
			})
			.then(()=>{ 
				localStorage.clear();
				window.location.assign("http://localhost:8080/")
			})
			.catch();
		}
	}
}
</script>

<style lang="scss">
.deluse{
	border: 1px solid red;
	border-radius: 5px;
	color: red;
	&:hover{
		background-color: red;
		color: black;
		border: 1px solid black;
	}
	margin: 5%;
}
</style>

