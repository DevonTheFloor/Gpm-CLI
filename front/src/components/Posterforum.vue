<template>
  <form  enctype="multipart/form-data">
    <input type="hidden" id="auteur" name="auteur" :value="email">
    <label>Titre : <input type="text" id="titre" name="titre" v-model="titre"> </label>
    <label>Message : <textarea id="message" name="message" v-model="message"></textarea> </label>
    <input type="file" id="file" name="file">
    <button @click="poster">POSTER</button>
  </form>
</template>

<script>
export default {
  name: 'Posterforum',
  data(){
      return{
        email: '',
        mdp:'',
        titre:'',
        message:''
      }
    },
    methods:{
      poster(){}
    }
}
</script>

<style lang="scss">

</style>