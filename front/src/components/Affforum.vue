<template>
  <!--<section  class=" col-lg-10" v-for="item in info.data" :key="item.id">-->
  <section>
    <div class="listForum" >
      <button >X</button>
        <a :href="'/api/postVue.html?id='+item._id"><h2> {{ item.titre }} </h2></a>
        <p> {{ item.auteur }} </p>
        <p> {{ item.message }} </p>
     </div>
  </section>
</template>

<script>
export default {
	name: 'Affforum',
		mounted(){

      let token = localStorage.getItem('token');
      console.log("tokenStorage: ",token);
      var config = {
      headers: { 
          "Authorization":"Bearer "+token
        }
      };
      /**
       * GET recupère tous les post du forum
      */
       this.axios.get('http://localhost:4040/api/forum/posts',  config)
      .then((response) => {
      this.info = response,
      console.log(response)
      })
      .catch(error => console.log(error));
      }
}
</script>