<template>
  <div class="test">
		<h1>COUCOU WELL COME ON TEST</h1>
		<h3>COUCOU MOI</h3>
		<div v-for="item in info" :key="item.id">
			TITRE : {{ info.titre }}
		</div>
		{{ info }}

	</div>
</template>

<script>

export default {
  name: 'Test',
  components:{

  },
	data(){
		return{
			info:'',
			token:''
		}
	},
	mounted(){
		console.log('MOUNTED');
	let token = localStorage.getItem('token');
    this.token = token;
		this.axios.get('http://localhost:4040/api/market/see/1',{
      headers:{
        "Authorization":"Bearer "+this.token
        }
      })
      .then(response=>{
        this.info = response.data;
        console.log(response.data);
        })
        .catch(function (error) {console.log(error);
		})
		.then(function () {console.log('FINALY');});
	}
}
</script>