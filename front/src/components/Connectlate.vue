<template>
<!--<form @submit.prevent="submit">-->
  <form>
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
  <input type="hidden" id="isadm" name="isadm" value="0">

  <!--<button class="button" type="submit" :disabled="submitStatus === 'PENDING'">S'enregistrer</button>-->
  <button class="button" @submit.prevent="submit">S'enregistrer</button>
  <p class="typo__p1" v-if="submitStatus === 'OK'">Merci!</p>
  <p class="typo__p2" v-if="submitStatus === 'ERROR'">Merci de renseigner correctement l'email'.</p>
  <p class="typo__p3" v-if="submitStatus === 'PENDING'">Création du compte...</p>

	<!--<button class="button" type="submit" :disabled="submitStatus === 'PENDING'">Connexion</button>-->
  <button class="button" @coucou.prevent="submit">S'enregistrer</button>
  <p class="typo__p1" v-if="submitStatus === 'OK'">Merci!</p>
  <p class="typo__p2" v-if="submitStatus === 'ERROR'">Merci de renseigner correctement le mot de passe.</p>
  <p class="typo__p3" v-if="submitStatus === 'PENDING'">Connection ...</p>
</form>
</template>

<script>

import { required, minLength } from 'vuelidate/lib/validators'

export default {
  data() {
    return {
      isadm:0,
      email: '',
      name: '',
      submitStatus: null
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
    submit() {
      console.log('on submitation!')
      this.$v.$touch()
      if (this.$v.$invalid) {
        this.submitStatus = 'ERROR'
      } else {
        console.log('Serfice tes Dpuanes !!')
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
</style>
