<script>
    import axios from 'axios';
    import ProductImageVue from '../components/ProductImage.vue';
    import {cart} from '../store/cart.js'
    export default {
        components:{
            ProductImageVue,
        },
        data(){
            return{
                idKeyboard:"",
                keyboard:{},
                selectColor:"",
                selectSwitch:"",
                selectLanguage:"",
                cart,
                quatity:1
            }
        },
        created(){
            this.idKeyboard = this.$route.query.id
            this.fetchData(this.idKeyboard)
        },
        methods:{
            fetchData : async function(id){
                const url = `http://localhost:8080/keyboard/${id}`
                await axios.get(url).then(res => {
                    this.keyboard = res.data
                }).catch(err => console.log(err))
            },
            addToCart : function(){
                const  {id,name,price,image} = this.keyboard
                const  product = {
                    p_id:id,
                    p_name:name,
                    p_price:price,
                    p_image:image,
                    p_color:this.selectColor,
                    p_switch:this.selectSwitch,
                    p_lang:this.selectLanguage,
                    p_quatity:this.quatity
                }
                cart.addProduct(product)
            }
        }
    }
</script>

<template>
    <div class="container-fluid" style="background-color:#white;padding:15px;">
        <div class="row">
            <div class="col-lg-2 order-lg-1 order-2">
                <ProductImageVue
                    v-for="i in 3"
                    :product="keyboard"
                    :key="i"
                />
            </div>
            <div class="col-lg-4 order-lg-2 order-1">
                <ProductImageVue
                    v-for="i in 1"
                    :product="keyboard"
                    :key="i"
                />
            </div> 
            <div class="col-lg-6 order-3">
                <div class="m-3">
                    <h3>{{keyboard.name}}</h3>
                    <h5>{{keyboard.price}} ฿</h5>
                    <p>Tax included</p>
                    <hr/>
                    <div class="container m-2">
                        <div class="row">
                            <label>Color</label><br/>
                            <div class="column m-2">
                                <h5>{{selectColor}}</h5>
                                <input type="radio" class="btn-check" style="background-color:#A9A9A9;" id="Dark"  value="DarkGray" v-model="selectColor"/>
                                <label for="Dark" class="btn m-1" style="background-color:#A9A9A9;">DarkGray</label>
                                <input type="radio" class="btn-check" id="Light"  value="LightGray" v-model="selectColor"/>
                                <label for="Light" class="btn m-1" style="background-color:#D3D3D3;">LightGray</label>
                            </div>
                        </div>
                    </div>
                    <div class="container m-2">
                        <div class="row">
                            <label>Switch</label><br/>
                            <div class="column m-2">
                                <h5>{{selectSwitch}}</h5>
                                <input type="radio" class="btn-check" id="redswitch" value="Red" v-model="selectSwitch">
                                <label class="btn m-1" for="redswitch" style="background-color:red;">Red</label>
                                <input type="radio" class="btn-check " id="blownswitch" value="Brown" v-model="selectSwitch" >
                                <label class="btn m-1" for="blownswitch" style="background-color:brown;" >Brown</label>
                                <input type="radio" class="btn-check " id="blueswitch"  v-model="selectSwitch" value="Blue">
                                <label class="btn m-1" for="blueswitch" style="background-color:blue;" >Blue</label>
                            </div>
                        </div>
                    </div>
                    <div class="container m-2">
                        <div class="row">
                            <label>Language</label><br/>
                            <div class="column m-2">
                                <h5>{{selectLanguage}}</h5>
                                <input type="radio" class="btn-check" id="th" v-model="selectLanguage" value="Thai">
                                <label class="btn m-1" style="background-color:#ddd;" for="th">Thai</label>
                                <input type="radio" class="btn-check " id="eng" v-model="selectLanguage" value="English">
                                <label class="btn m-1" style="background-color:#ddd;" for="eng">English</label>
                            </div>
                        </div>
                    </div>
                    <div class="container m-2">
                        <div class="row">
                            <label>Quatity</label><br/>
                            <div class="column m-2">
                                <button @click="quatity>=2?quatity--:quatity=1">-</button>
                                <input type="number" v-model="quatity">
                                <button @click="quatity++">+</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-grid gap-2 col-8 m-3">
                    <button class="btn btn-outline-dark" type="button" @click="addToCart()">เพิ่มลงตะกร้าสินค้า</button>
                    <button class="btn btn-dark" type="button">Buy it now</button>
                </div>
            </div>
        </div>
    </div>
    
</template>

<style scoped>

</style>