<template>
  <div id="app">
    <main>
      <Accueil/>
      <Signup/>
      <Login/>
    </main>
  </div>
</template>

<script>

import Accueil from './components/Accueil'
import Signup from './components/Signup'
import Login from "./components/Login"

export default {
  name: 'App',
  components: {
    Accueil,
    Signup,
    Login
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
