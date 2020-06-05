<template>
	<button class="dbtn" @click="deletemsg">x</button>
</template>

<script>
export default {
	name: 'Deletebtn',
	props:['id','idmessage'],
	data(){
		return{
			info:'',
		}
	},
	methods:{
		deletemsg(){
			console.log('COUCOU');
			let idm = this.id_question;
      console.log(idm);
      let token = localStorage.getItem('token');
      token;
      console.log('CLICKING !!')
      this.axios.delete('http://localhost:4040/api/forum/deleteone/'+idm,{
        headers:{
          "Authorizartion":"Bearer "+token
          }
         })
         .then(()=>{window.location.assign('http://localhost:8080/#/zi-forum')})
         .catch(error => {console.log(error)});
				}
		}
		
	}
</script>

<style lang="scss">
.dbtn{
	color: red;
	background-color: rgb(245, 161, 161);
	border: 1px solid red;
}
</style>