<script>
    export default {
        props: {
            keyboard: Object
        },
        data(){
            return{
                product:this.keyboard
            }
        },
        methods:{
            getKeyboard:function(value){
                this.$router.push("/keyboard/"+value.id)
                
            }
        }
        

    }
    </script>
    
<template>
    <div class="card m-3 p-2" style="width: 18rem;" v-on:click="getKeyboard(product)">
        <img :src="product.image" class="card-img-top" />
        <div class="card-body">
            <h5 class="card-title">{{product.name}}</h5>
            <p class="card-text">{{'price:'+product.price}}</p>
        </div>
    </div>
</template>

<style>

</style>