<script>
import CardVue from '../components/CardProduct.vue'

export default {
  components: {
    CardVue
  },
  data() {
    return {
      keyboard:[]
    }
  },
  created(){
    this.fetchData()
  },
  methods:{
    async fetchData(){
      const url ="http://localhost:8080/all"
      await this.axios.get(url).then(res =>{
        this.keyboard = res.data
      }
      ).catch(err => console.log(err))
    }
  }
}

</script>

<template>
  <div class="container">
    <div class="row row-cols-3">
      <CardVue
        v-for="( item,i) in keyboard"
        :keyboard="item"
        :key="i"
      />
    </div>
  </div>
</template>

<style>

</style>