<template>
  <div class="sommaire">
    <Head/>
    <p  @click="disconnection" class="disconnect"><router-link to="/">disconnect</router-link></p>

     <section class="menuSom">
      <h2><router-link to="/zi-forum">FORUM</router-link></h2>
    </section >
      <section class="menuSom">
      <h2><router-link to="/market-place">Market Place</router-link></h2>
    </section >
      <section class="menuSom">
      <h2><router-link to="/chat-live">Chat</router-link></h2>
    </section>

  </div>
</template>

<script>

import Head from '../components/Head'
export default {

  name: 'Sommaire',
  components:{
    Head
  },
methods:{
  disconnection(){
    localStorage.clear();
  }
}
}
</script>

<style lang="scss">
h1{
  color:green;
}
.menuSom{
  border: 2px solid grey;
  border-radius: 5px;
  background-color: beige;
  box-shadow: 2px 2px 2px 8px white;
  margin: 3%;
  padding: 2%;
  transform: scale(1) 3000ms cubic-bezier(0.32, 0, 0.07,1);
  &:hover{
    transform: scale(1.2);
    box-shadow: 5px 5px 5px 12px white;
  }
  &:active{
     background-color: grey;
      color: white;
  }
}
.disconnect{
  margin: 1%;
  padding: 1%;
  color: beige;
  font-size: larger;
  border: 2px solid beige;
  border-radius: 10px;
  display: inline-block;
  &:hover{
    cursor: pointer;
  }
  &:active{
    background-color: ivory;
    color: black;
  }
}
</style>
