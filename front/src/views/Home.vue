<template>
  <div class="home">
    <img class="laclass" alt="Vue logo" src="../assets/logo.png">
    <Accueil/>
    <!--<Connect/>-->
    <Connectlate/>
  </div>
</template>

<script>
// @ is an alias to /src
import Accueil from '@/components/Accueil.vue'
//import Connect from '@/components/Connect.vue'
import Connectlate from '@/components/Connectlate.vue'


export default {
  name: 'Home',
  components: {
    Accueil,
    //Connect,
    Connectlate
  },
  mounted(){
    
  }
}
</script>

<style lang="scss">
.laclass{
  max-width: 50px;
}
</style>
