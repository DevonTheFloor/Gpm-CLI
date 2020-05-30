<template>
  <section  class="justify-content-lg-center">
    <p id="confMessage"> </p>
    <form id="appform" >
      <label for="email"> email: </label>
      <input id="email" v-model="email" type="text" name="email">
      <label for="name"> mot de passe : </label>
      <input id="mdp" v-model="mdp" type="text" name="mdp">
			<br/>
      <button id="btn-signup" type="submit" @click="createUser">Créer un compte</button>
    </form>
  </section>
</template>

<script>
export default {
	name: 'Signup',
	data(){
		return{
			email: ' ',
			mdp: ' '
		}
	},
	methods:{
    createUser(e){
      e.preventDefault();
      console.log("form submit");
       
      let adduser = {
        email: this.email,
        mdp: this.mdp
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

 
