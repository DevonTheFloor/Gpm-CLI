<template>
    <section  class="justify-content-lg-center">
        <p id="confMessage"> </p>
      <form id="appform" >
        <label> email: <input id="email" v-model="email" type="text" name="email"></label>
        <label> mot de passe : <input id="name" v-model="mdp" type="text" name="mdp"></label>
        <input type="hidden" id="isadm" name="isadm" :value="isadm">
        <br/>
          <button id="btn-signup" type="submit" @click="createUser">Créer un compte</button>
          <button id="btn-cnt" @click="loginuser" > Se Connecter </button>
      </form>
    </section>
</template>

<script>
export default {
    name: 'Connect',
    data(){
        return{
          isadm:false,
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
          mdp: this.mdp,

        }
      this.axios.post('http://localhost:4040/api/auth/login',loginfo
        )
          .then(function(response) {
            console.log(response.data),
            localStorage.setItem("email",response.data.email),
            localStorage.setItem("token",response.data.token),
            localStorage.setItem("isadm",response.data.isadm)

            })
            .then( window.location.assign('http://localhost:8080/#/vous-etes-ici'))
          .catch(function (error) {
            console.log(error);
            });
        },
         createUser(e){
      e.preventDefault();
      console.log("form submit");
       
      let adduser = {
        email: this.email,
        mdp: this.mdp,
        isadm:this.isadm
        };
      let newUser = JSON.stringify(adduser);
      console.log("adduser = ", adduser);
      let request = new XMLHttpRequest();
      request.onload = function () {
        if (this.readyState == 4) {
          console.log("connexion a la bdd");
          let response = JSON.parse(this.responseText);
          console.log(response);
          document.getElementById('confMessage').innerHTML = response.message;
          console.log(response);
            }
        }
      request.open("post","http://localhost:4040/api/auth/signup");
      request.setRequestHeader("Content-Type", "application/json");
      request.send(newUser);
			}
    }
}
</script>

<style lang="scss">
section {
	margin: 1%
	}
  #confMessage{
    color: blue;
    border:blue;
    background-color: rgb(135, 192, 240);
  }

</style>