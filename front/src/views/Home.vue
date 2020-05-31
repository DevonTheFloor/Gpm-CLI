<template>
  <div class="home">
    <img class="laclass" alt="Vue logo" src="../assets/logo.png">
    <Accueil/>
    <Signup/>
    <Login/>
  </div>
</template>

<script>
// @ is an alias to /src
import Accueil from '@/components/Accueil.vue'
import Signup from '@/components/Signup.vue'
import Login from '@/components/Login.vue'

export default {
  name: 'Home',
  components: {
    Accueil,
    Signup,
    Login
  }
}
</script>

<style lang="scss">
.laclass{
  max-width: 50px;
}
</style>
