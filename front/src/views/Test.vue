<template>
  <div class="test">
		<h1>COUCOU WELL COME ON TEST</h1>
		<h3>COUCOU MOI</h3>
    <Connectlate/>
	</div>
</template>

<script>
import Connectlate from '../components/Connectlate'
export default {
  name: 'Test',
  components:{
    Connectlate
  },
	data(){
		return{
			resall:''
		}
	}
}
</script>