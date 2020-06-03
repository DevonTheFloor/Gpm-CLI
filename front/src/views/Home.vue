<template>
  <div class="home">
    <img class="laclass" alt="Vue logo" src="../assets/logo.png">
    <Accueil/>
    <Connect/>
    <Formlidate/>
  </div>
</template>

<script>
// @ is an alias to /src
import Accueil from '@/components/Accueil.vue'
import Connect from '@/components/Connect.vue'
import Formlidate from '@/components/Formlidate.vue'


export default {
  name: 'Home',
  components: {
    Accueil,
    Connect,
    Formlidate
  },
  mounted(){
    /*let iscox = localStorage.getItem('email');
    if(iscox){
      window.location.assign('http://localhost:8080/#/vous-etes-ici');
    }*/
    
  }
}
</script>

<style lang="scss">
.laclass{
  max-width: 50px;
}
</style>
