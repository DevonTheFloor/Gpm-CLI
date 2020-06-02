<template>
  <div class="test">
		<h1>COUCOU WELL COME ON TEST</h1>
		<h3>COUCOU MOI</h3>
  <section  v-for="res in resall" :key="res.id">
		<h4>Liste Réponses</h4>
    <div class="listForum" >
			<p>La faut dire un truc</p>
      <p>Par : {{ res.auteur }} </p>
      <p>le: {{ res.quand }} </p>
      <p class="msgForum"> {{ res.message }} </p>
      <p> </p>
    </div>
   </section>
	</div>
</template>

<script>
export default {
	name: 'Test',
	data(){
		return{
			resall:''
		}
	},
	mounted(){
		//requête post(auth) voir toutes les reponses d'un post choisi
    this.axios.post("http://localhost:4040/api/forum/reponse/all",{
      //id_question: this.id_question
      id_question : 14
      },{
        headers:{
          "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3QiLCJpYXQiOjE1OTEwNzEwNTcsImV4cCI6MTU5MTE1NzQ1N30.jkZog8_isLS7ZgK36Z5pMpmNoigoIZpkqsJtjfzHIFg"
          }
        })
        .then(response => {
        this.resall = response.data;
        console.log("resAll:" ,response.data)})
        .catch(error => {console.log(error)});
	}
}
</script>