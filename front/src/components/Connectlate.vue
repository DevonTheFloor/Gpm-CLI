<template>
<div>
  <p id="confMessage"> </p>
<button @click="seesign" class="btnch">S'enregistrer</button>
<button @click="seelog" class="btnch">Se connecter</button>
<hr>
<br>
<form v-show="sign" @submit.prevent="submit">
  <div class="form-group" :class="{ 'form-group--error': $v.email.$error }">
    <label class="form__label">Email</label>
    <input class="form__input" v-model.trim="$v.email.$model"/>
  </div>
  <div class="error_1" v-if="!$v.email.required">Champs email obligatoire</div>
  <div class="error" v-if="!$v.email.minLength">Email doit avoir au moins {{$v.email.$params.minLength.min}} caractères.</div>

	<div class="form-group" :class="{ 'form-group--error': $v.mdp.$error }">
    <label class="form__label">Mot de passe</label>
    <input class="form__input" v-model.trim="$v.mdp.$model"/>
  </div>
  <div class="error_1" v-if="!$v.mdp.required">Mot de passe requis</div>
  <div class="error" v-if="!$v.mdp.minLength">Doit avoir au moins {{$v.mdp.$params.minLength.min}} caractères.</div>
  
 
  <button class="button senregistrer" type="submit" :disabled="submitStatus === 'PENDING'">S'enregistrer</button>
  <p class="typo__p" v-if="submitStatus === 'OK'">Merci!</p>
  <p class="typo__p" v-if="submitStatus === 'ERROR'">Merci de renseigner correctement les champs.</p>
  <p class="typo__p" v-if="submitStatus === 'PENDING'">Envoi...</p>
</form>

<form  v-show ="login" @submit.prevent="connecting">
  <div class="form-group" :class="{ 'form-group--error': $v.email.$error }">
    <label class="form__label">Email</label>
    <input class="form__input" v-model.trim="$v.email.$model"/>
  </div>
  <div class="error_1" v-if="!$v.email.required">Champs email obligatoire</div>
  <div class="error" v-if="!$v.email.minLength">Email doit avoir au moins {{$v.email.$params.minLength.min}} caractères.</div>

	<div class="form-group" :class="{ 'form-group--error': $v.mdp.$error }">
    <label class="form__label">Mot de passe</label>
    <input type="password" class="form__input" v-model.trim="$v.mdp.$model"/>
  </div>
  <div class="error_1" v-if="!$v.mdp.required">Mot de passe requis</div>
  <div class="error" v-if="!$v.mdp.minLength">Doit avoir au moins {{$v.mdp.$params.minLength.min}} caractères.</div>
  
  <button  class="button seconnecter " type="submit" :disabled="submitStatus === 'PENDING'" >Se connecter</button>
  <p class="typo__p" v-if="submitStatus === 'OK'">Merci!</p>
  <p class="typo__p" v-if="submitStatus === 'ERROR'">Merci de renseigner correctement les champs.</p>
  <p class="typo__p" v-if="submitStatus === 'PENDING'">Envoi...</p>
 
</form>
</div>

</template>

<script>

import { required, minLength } from 'vuelidate/lib/validators'

export default {
  data() {
    return {
      sign: true,
      login:false,
      email: '',
      mdp: '',
      submitStatus: null,

    }
  },
  validations: {
    email: {
      required,
      minLength: minLength(4)
		},
		mdp: {
      required,
      minLength: minLength(4)
		}
  },
  methods: {
    seesign(){
      this.sign = true;
      this.login = false;
    },
    seelog(){
      this.sign = false;
      this.login = true;
    },
    submit() {
      console.log('on submitation!')
      this.$v.$touch()
      if (this.$v.$invalid) {
        this.submitStatus = 'ERROR'
      } else {
         console.log("form signup submit");
       
      let adduser = {
        email: this.email,
        mdp: this.mdp,
        isadm: "false"
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
        this.submitStatus = 'PENDING'
        setTimeout(() => {
          this.submitStatus = 'OK'
        }, 500)
      }
    },
    connecting() {
      console.log('on submitation!')
      this.$v.$touch()
      if (this.$v.$invalid) {
        this.submitStatus = 'ERROR'
      } else {
          console.log("form login submit");
          let loginfo ={
          email: this.email,
          mdp: this.mdp
        }
      this.axios.post('http://localhost:4040/api/auth/login',loginfo
        )
          .then(function(response) {
            console.log(response.data),
            localStorage.setItem("email",response.data.email),
            localStorage.setItem("token",response.data.token),
            localStorage.setItem('idu',response.data.idu),
            localStorage.setItem('isadm',response.data.isadm)
            })
            .then(setTimeout(function(){  window.location.assign('http://localhost:8080/#/vous-etes-ici') },1300))
          .catch(function (error) {
            console.log(error);
            });
        this.submitStatus = 'PENDING'
        setTimeout(() => {
          this.submitStatus = 'OK'
        }, 500)
      }
    },
    coucou(){
      console.log('COUCOU')
    }
  }
}

</script>

<style lang="scss">
.error{
	color:red;
	&_1{
		color: blue;
	}
}

.typo__p1{
	color: green;
}
.typo__p2{
	color: orange;
	border: 2 px solid orange;
	background-color: yellow;
}
.typo__p3{
	color: yellow;
}
.seconnecter{
  background-color: rgb(169, 210, 238);
}
.senregistrer{
  background-color: rgb(246, 194, 145);
}
.btnch{
  background-color: beige;
  border-radius: 5px;
  &:hover{
    background-color: rgb(207, 207, 128);
  }
}
  #confMessage{
    color: blue;
    border:blue;
    background-color: rgb(135, 192, 240);
  }
</style>
