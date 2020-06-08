<template>
<form @submit.prevent="submit">
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

  <button class="button" type="submit" :disabled="submitStatus === 'PENDING'">S'enregistrer</button>
  <p class="typo__p" v-if="submitStatus === 'OK'">Merci!</p>
  <p class="typo__p" v-if="submitStatus === 'ERROR'">Merci de renseigner correctement les champs.</p>
  <p class="typo__p" v-if="submitStatus === 'PENDING'">Envoi...</p>
</form>
</template>

<script>

import { required, minLength } from 'vuelidate/lib/validators'

export default {
  data() {
    return {
      email: '',
      mdp: '',
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
        console.log('Serfice tes Douanes !!')
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
