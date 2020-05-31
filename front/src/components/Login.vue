<template>
    <section  class="justify-content-lg-center">
      <form id="appform" >
        <label> email: <input id="email" v-model="email" type="text" name="email"></label>
        <label> mot de passe : <input id="name" v-model="mdp" type="text" name="mdp"></label>
        <br/>
          <button id="btn-cnt" @click="loginuser" > Se Connecter </button>
      </form>
      <router-link to="sommaire">Sommaire</router-link>
    </section>
</template>

<script>
export default {
    name: 'Login',
    data(){
        return{
            email: '',
            mdp: ''
        }
    },
    methods:{
      loginuser (e){
      e.preventDefault();
      console.log("form submit");
      let loginfo ={
          email: this.email,
          mdp: this.mdp
        }
      this.axios.post('http://localhost:4040/api/auth/login',loginfo
        )
          .then(function(response) {
            console.log(response.data),
            localStorage.setItem("email",response.data.email),
            localStorage.setItem("token",response.data.token)

            })
            /*.then(()=>{
              let token = localStorage.getItem('token');
              this.axios.get('http://localhost:4040/api/',
              { headers: 
                {'Aunthorisation': 'Bearer '+token}},
              )*/
            .then( window.location.assign('/sommaire'))
              //.then(()=>{console.log("OKAAAAAAAAAy!!")})
              /*.catch(()=>{console.log("erreur redirection")});
              })*/
          .catch(function (error) {
            console.log(error);
            });
        }
    }
}
</script>

<style lang="scss">
section {
	margin: 1%
	}

</style>