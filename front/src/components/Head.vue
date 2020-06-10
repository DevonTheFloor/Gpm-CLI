<template>
	<header>
    <div class="head">
      <div class="col-lg-8 offset-lg-2  hero" >
      <a :href='page'> <img class="img-fluid" src="../assets/image/logo/ban2.png"></a>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  name :'Head',
  props:['page']
}
</script>

<style lang="scss">
header{
min-width: 100%;
}
</style>