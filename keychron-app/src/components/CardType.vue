<script>


export default {
    props:{
        typeKeyboard:Object,
        page:String
    },
    methods:{
        navigateTo:function(){
            this.$router.push(this.page)
        }
    }
}
</script>

<template>
    <div class="col card m-4 p-3" style="width: 18rem;" v-on:click="navigateTo">
        <img :src="typeKeyboard.image" class="card-img-top" alt="">
        <div class="card-body">
            <h5 class="card-title text-center">{{typeKeyboard.name}}</h5>
        </div>
    </div>     
</template>
