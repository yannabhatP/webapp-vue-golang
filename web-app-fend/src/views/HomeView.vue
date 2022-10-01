<script>
import CarouselVue from '@/components/Carousel.vue';
import CardTypeVue from '@/components/CardType.vue';

import CardAboutVue from '@/components/CardAbout.vue';
export default {
  components:{
    CarouselVue,
    CardTypeVue,
    CardAboutVue
  },
  data() {
    return {
      carousalData:[],
      keyType:[],
      aboutKey:[]
    }
  },
  created(){
    this.fetchData()
  },
  methods:{
    async fetchData(){
      const url ="/src/assets/about.json"
      const res = await fetch(url)
      const data = await res.json()
      this.carousalData = data.carousal
      this.keyType = data.type
      this.aboutKey = data.about
    }
  }
  
  
}
</script>

<template>
  <div class="container-fluid mb-5">
    <div class="row">
      <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <CarouselVue
            v-for="item in carousalData"
            :carousal="item"
            :key="item.id"
          />
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
       
      </div>
    </div>
    <div class="row ">
      <CardTypeVue
        v-for="item1 in keyType"
        :typeKeyboard="item1"
        :key="item1.id"
      /> 
    </div>
    <div class="row ">
      <CardAboutVue
        v-for="item2 in aboutKey"
        :aboutKeyboard="item2"
        :key="item2.id"
      />
    </div>
    
  </div>
   
  
</template>

<style>

</style>