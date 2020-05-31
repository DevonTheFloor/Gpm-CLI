<template>
    <p><router-link to="/">disconnect</router-link></p>
</template>


<style lang="scss">
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