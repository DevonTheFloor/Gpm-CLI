<template>
  <div class="sommaire">
    <Head page="http://localhost:8080/"/>
    <p  @click="disconnection" class="disconnect"><router-link to="/">disconnect</router-link></p>

    <p > IS ADMIN : {{ this.isadm }} </p>

     <section class="menuSom">
      <h2><router-link to="/zi-forum">FORUM</router-link></h2>
    </section >
      <section class="menuSom">
      <h2><router-link to="/market-place">Market Place</router-link></h2>
    </section >
      <section class="menuSom">
      <h2><router-link to="/chat-live">Chat</router-link></h2>
    </section>
    <section  v-if="isadm == 'true'" class="menuSom">
      <h2><router-link to="/stat">Statistique</router-link></h2>
      <p class="mesadm">Accés admin uniquement</p>
    </section>
    <Deletuser/>

  </div>
</template>

<script>

import Head from '../components/Head'
import Deletuser from '../components/Deletuser'
export default {

  name: 'Sommaire',
  components:{
    Head,
    Deletuser
  },
  data(){
    return{
      isadm: '',
    }
  },
    computed: {

    },
  methods:{
    disconnection(){
      localStorage.clear();
      }
    },
    mounted(){
      let isadm = localStorage.getItem('isadm');
      console.log('isadm',isadm);
      this.isadm = isadm;
      

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
.mesadm{
  color: blue;
}
</style>
