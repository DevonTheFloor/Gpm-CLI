<template>
<form @submit.prevent="submit">
  <div class="form-group" :class="{ 'form-group--error': $v.email.$error }">
    <label class="form__label">Email</label>
    <input class="form__input" v-model.trim="$v.email.$model"/>
  </div>
  <div class="error_1" v-if="!$v.email.required">Champs email obligatoire</div>
  <div class="error" v-if="!$v.name.minLength">email doit avoir au moins {{$v.name.$params.minLength.min}} caractères.</div>

	<div class="form-group" :class="{ 'form-group--error': $v.name.$error }">
    <label class="form__label">Name</label>
    <input class="form__input" v-model.trim="$v.name.$model"/>
  </div>
  <div class="error_1" v-if="!$v.name.required">Motde passe requis</div>
  <div class="error" v-if="!$v.name.minLength">Doit avoir au moins {{$v.name.$params.minLength.min}} caractères.</div>

  <button class="button" type="submit" :disabled="submitStatus === 'PENDING'">S'enregistrer</button>
  <p class="typo__p" v-if="submitStatus === 'OK'">Merci!</p>
  <p class="typo__p" v-if="submitStatus === 'ERROR'">Merci de renseigner correctement les champs.</p>
  <p class="typo__p" v-if="submitStatus === 'PENDING'">Création du compte...</p>

	<button class="button" type="submit" :disabled="submitStatus === 'PENDING'">Connexion</button>
  <p class="typo__p" v-if="submitStatus === 'OK'">Merci!</p>
  <p class="typo__p" v-if="submitStatus === 'ERROR'">Merci de renseigner correctement les champs.</p>
  <p class="typo__p" v-if="submitStatus === 'PENDING'">Connection ...</p>
</form>
</template>

<script>

import { required, minLength } from 'vuelidate/lib/validators'

export default {
  data() {
    return {
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
		name: {
      required,
      minLength: minLength(4)
		}
  },
  methods: {
    submit() {
      console.log('submitation!')
      this.$v.$touch()
      if (this.$v.$invalid) {
        this.submitStatus = 'ERROR'
      } else {
        console.log('Sefice tes Dpuanes !!')
        this.submitStatus = 'PENDING'
        setTimeout(() => {
          this.submitStatus = 'OK'
        }, 500)
      }
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
