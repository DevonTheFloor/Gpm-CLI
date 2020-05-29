<template>
  <div id="app">
    <Accueil/>
  </div>
</template>

<script>

import Accueil from './components/Accueil'

export default {
  name: 'App',
  components: {
    Accueil
  }
}
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
