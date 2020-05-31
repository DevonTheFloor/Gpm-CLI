<template>
    <div id="messagesForum" class=" justify-content-lg-center " >

        <button id="postforum" @click="seeform">Poster un message</button>

        <Posterforum v-if="seen"/>

        <Affforum/>

   
      </div>
</template>

<script>
import Affforum from '@/components/Affforum.vue'
import Posterforum from '@/components/Posterforum.vue'

export default {
		name: 'Forum',
    component: {
      Affforum,
      Posterforum
    }
		,
		methods:{
			seeform(){
          this.seen = true;
          this.seeAll = false
        }
		} 
	}

</script>

<style lang="scss">
.msgForum{
  border: 2px solid rgba(255, 255, 255, 0.794);
  background-color: rgb(248, 248, 241);
  border-radius: 10px;
  padding: 1%;
  margin: 1%;
}

</style>