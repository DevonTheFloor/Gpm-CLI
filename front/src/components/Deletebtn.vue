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
        let urlimg = this.info.urlimg;
        console.log('urlimg :',urlimg);
        let uri1 = document.location.href;
        console.log('uri1 :',uri1);
        let test = uri1.split('#')[1];
        console.log('test :' ,test);

        let url3 = new URL(test,'http://localhost');
        let id = url3.searchParams.get('id');
        console.log("idmesg :",id)
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