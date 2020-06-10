<template>
  <div id="app" class="container-fluid">
      <router-view/>
  </div>
</template>

<style lang="scss">

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  min-height: 100%;
  align-items: center;
}
.dbtna{
  margin:3%;
	color: red;
	background-color: rgb(240, 197, 118);
	border: 1px solid red;
}
.picMarket {
  width: 70%;
  border:2px solid black;
  box-shadow: 3px 3px 3px grey;
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
    background-color: beige;
  }
  &:active{
    background-color: ivory;
    color: black;
  }
}
h1,h2,h3,h4{
  text-align: center;
  &:hover{
    color: blueviolet;
    font-size: xx-large;
  }
}
.menuSom{
  width: 65%;
}
.justify{
  display: flex;
  align-items: center;
  flex-direction: column;
}
section{
  width: 70%;
}
.connectlate{
  border: 2px solid beige;
}

</style>

