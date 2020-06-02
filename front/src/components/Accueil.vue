<template>

    <section class="col-lg-12">
      <figure class="col-lg-8 offset-lg-2 " id="logo">
        <img class="img-fluid logoenter" src="../assets/image/logo/icon2.png" id="logokey" alt="icon groupomania" >
      </figure>
    </section>

</template>

<script>
export default {

  name: 'Accueil',

  }

</script>

<style lang="scss">
main {
  margin-bottom: 5%;
  padding: 2%;
  justify-content: space-around;
}
.logoenter{
  animation-name: turn;
  animation-duration: 3000ms;
  animation-iteration-count: 5; 
  transform: scale(1);
  transition: transform 2000ms cubic-bezier(0.32, 0, 0.07,1);
  &:hover{
    transform: scale(1.1);
  }
}
@keyframes turn {
  0% {
    transform: rotate(0deg); }
  100% {
    transform: rotate(360deg);
  }
}

</style>