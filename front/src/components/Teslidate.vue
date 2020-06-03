<template>
<form @submit.prevent="submit">
  <div class="form-group" :class="{ 'form-group--error': $v.email.$error }">
    <label class="form__label">Email</label>
    <input class="form__input" v-model.trim="email" @input="setName($event.target.value)"/>
  </div>
  <div class="error_1" v-if="!$v.email.required">Champs Obligatoire</div>
  <div class="error" v-if="!$v.email.minLength">Doit avoir au moins {{$v.email.$params.minLength.min}} caractères.</div>
		<label class="form__label">Mot de passe</label>
    <input type="password" class="form__input" v-model.trim="mdp" @input="setName($event.target.value)"/>
  <div class="error_1" v-if="!$v.mdp.required">Champs Obligatoire</div>
  <div class="error" v-if="!$v.mdp.minLength">Doit avoir au moins {{$v.mdp.$params.minLength.min}} caractères.</div>
  <button class="button" type="submit" :disabled="submitStatus === 'PENDING'">Submit!</button>
  <p class="typo__p1" v-if="submitStatus === 'OK'">Thanks for your submission!</p>
  <p class="typo__p2" v-if="submitStatus === 'ERROR'">Merci de renseigner les champs correctement</p>
  <p class="typo__p3" v-if="submitStatus === 'PENDING'">Sending...</p>
</form>
</template>

<script>

import { required, minLength, helpers } from 'vuelidate/lib/validators'
const alpha = helpers.regex('alpha', /@/)
export default {
  data() {
    return {
      email: '',
      mdp: ''
    }
  },
  validations: {
    email: {
      required,
			minLength: minLength(4),
			helpers: alpha
    },
    mdp: {
      minLength: minLength(5)
    }
  },

  methods: {
    setName(value) {
      this.name = value
      this.$v.name.$touch()
		},
		submit() {
      console.log('submit!')
      this.$v.$touch()
      if (this.$v.$invalid) {
        this.submitStatus = 'ERROR'
      } else {
        console.log('Polisse tes douanes!')
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
