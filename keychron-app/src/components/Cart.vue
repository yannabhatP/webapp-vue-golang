<script>

    import {cart} from '../store/cart.js'
    export default{
        data(){
            return{
                cart,
                total:0
            }
        },
        watch:{
            cart:{
                handler(newVal){ 
                    this.total =0
                    newVal.product.forEach((item,i )=> {
                        this.total += item.p_price*item.p_quatity
                        if(item.p_quatity === 0) newVal.product.splice(i,1)
                    });
                    
                },
                deep: true,
                immediate: true 
            }
        },
        methods:{
            checkout:function (){
                this.$router.push('/checkout')
            }
        }
    }
</script>

<template>
    <hr/>
    <div class="offcanvas-body">
        <div v-if="cart.product.length === 0">
            <h4>Your cart is currently empty</h4>
        </div>
        <div v-else>
            <div class="container">
                <div class="row m-2 border border-secondary rounded p-2 " v-for="(item,i) in cart.product" :key="i">
                    <div class="col" >
                        <img :src="item.p_image" width="120"  >
                    </div>
                    <div class="col ">
                        <h6>{{item.p_name}}</h6>
                        <p>{{"color: "+item.p_color }}<br/>{{"switch: "+item.p_switch}}<br/>{{"lang: "+item.p_lang}}<br/>{{"price: "+item.p_price}}<br/></p>
                        <a href="#" @click="item.p_quatity--">-</a><a href="#" class="border">{{item.p_quatity}}</a><a @click="item.p_quatity++" href="#">+</a>
                    </div>
                </div>
            </div>
            <div class="position-absolute bottom-0 end-0 m-1">
                <h5>Total  : {{total}} ฿</h5>
                <p class="fs-6">Shipping, taxes, and discount codes calculated at checkout.</p>
                <div class="d-grid gap-2 m-1">
                    <button class="btn btn-warning" type="button" @click="cart.removeAllProduct()">Remove all</button>
                    <button class="btn btn-success" type="button" @click="checkout()">Check Out</button>
                </div>
            </div>
        </div>
    </div>
</template>

<style>

</style>