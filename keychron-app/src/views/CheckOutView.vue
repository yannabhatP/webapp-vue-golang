<script>
    
import {cart} from "../store/cart.js"
import {profile} from "../store/profile.js"
    export default {
        data(){
            return{
                cart,
                profile,
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
            onCheckOut:function(){
                if(profile.account == null){
                    this.$router.push('/login')
                }else{
                    let data={}
                    data.email = profile.account.email 
                    data.o_detail = JSON.stringify(cart.product)
                    this.axios.post('http://localhost:8080/order',data)
                    .then(()=>this.$router.push('/account'))
                    .catch(err=>alert(err))
                }
                
            }
        }
    }
</script>

<template>
    <div class="card m-5">
        <div class="row">
            <div class="col-md-8 cart">
                <div class="title">
                    <div class="row">
                        <div class="col"><h4><b>Shopping Cart</b></h4></div>
                        <div class="col align-self-center text-right text-muted">{{cart.product.length}} items</div>
                    </div>
                </div>
                <div class="row border-top border-bottom" v-for="(item,i) in cart.product" :key="i">
                    <div class="row main align-items-center">
                        <div class="col-2"><img class="img-fluid" :src="item.p_image"/></div>
                        <div class="col">
                            <div class="row ">{{item.p_name}}</div>
                            <p class="row text-muted">{{"color: "+item.p_color }}<br/>{{"switch: "+item.p_switch}}<br/>{{"lang: "+item.p_lang}}</p>
                        </div>
                        <div class="col">
                            <a href="#" @click="item.p_quatity--">-</a><a href="#" class="border">{{item.p_quatity}}</a><a @click="item.p_quatity++" href="#">+</a>
                        </div>
                        <div class="col">{{item.p_price}} ฿</div>
                    </div>
                </div> 
                <div class="back-to-shop" @click="$router.push('/')"><a >&leftarrow;</a><span class="text-muted">Back to shop</span></div>
            </div>
            <div class="col-md-4 summary">
                <div><h5><b>Summary</b></h5></div>
                <hr>
                <div class="row">
                    <div class="col" style="padding-left:0;">ITEMS {{cart.product.length}}</div>
                    <div class="col text-right">{{total}} ฿</div>
                </div>
                <form>
                    <p>SHIPPING</p>
                    <select><option class="text-muted">Standard-Delivery-Free</option></select>
                </form>
                <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                    <div class="col">TOTAL PRICE</div>
                    <div class="col text-right">{{total}} ฿</div>
                </div>
                <button class="btn" @click="onCheckOut">CHECKOUT</button>
            </div>
        </div> 
    </div>
</template>

<style scoped>
   
.title{
    margin-bottom: 5vh;
}
.card{
    margin: auto;
    max-width: 950px;
    width: 90%;
    box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    border-radius: 1rem;
    border: transparent;
}
@media(max-width:767px){
    .card{
        margin: 3vh auto;
    } 
    .cart{
        padding: 4vh;
        border-bottom-left-radius: unset;
        border-top-right-radius: 1rem;
    }
    .summary{
    border-top-right-radius: unset;
    border-bottom-left-radius: 1rem;
    }
    
}
.cart{
    background-color: #fff;
    padding: 4vh 5vh;
    border-bottom-left-radius: 1rem;
    border-top-left-radius: 1rem;
}

.summary{
    background-color: #ddd;
    border-top-right-radius: 1rem;
    border-bottom-right-radius: 1rem;
    padding: 4vh;
    color: rgb(65, 65, 65);
}
.summary .col-2{
    padding: 0;
}
.summary .col-10
{
    padding: 0;
}.row{
    margin: 0;
}
.title b{
    font-size: 1.5rem;
}
.main{
    margin: 0;
    padding: 2vh 0;
    width: 100%;
}
.col-2, .col{
    padding: 0 1vh;
}
a{
    padding: 0 1vh;
}
.close{
    margin-left: auto;
    font-size: 0.7rem;
}
img{
    width: 3.5rem;
}
.back-to-shop{
    margin-top: 4.5rem;
}
h5{
    margin-top: 4vh;
}
hr{
    margin-top: 1.25rem;
}
form{
    padding: 2vh 0;
}
select{
    border: 1px solid rgba(0, 0, 0, 0.137);
    padding: 1.5vh 1vh;
    margin-bottom: 4vh;
    outline: none;
    width: 100%;
    background-color: rgb(247, 247, 247);
}
input{
    border: 1px solid rgba(0, 0, 0, 0.137);
    padding: 1vh;
    margin-bottom: 4vh;
    outline: none;
    width: 100%;
    background-color: rgb(247, 247, 247);
}
input:focus::-webkit-input-placeholder
{
      color:transparent;
}
.btn{
    background-color: #000;
    border-color: #000;
    color: white;
    width: 100%;
    font-size: 0.7rem;
    margin-top: 4vh;
    padding: 1vh;
    border-radius: 0;
}
.btn:focus{
    box-shadow: none;
    outline: none;
    box-shadow: none;
    color: white;
    -webkit-box-shadow: none;
    
    transition: none; 
}
.btn:hover{
    color: white;
}
a{
    color: black; 
}
a:hover{
    color: black;
    text-decoration: none;
}
 #code{
    background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253) , rgba(255, 255, 255, 0.185)), url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
    background-repeat: no-repeat;
    background-position-x: 95%;
    background-position-y: center;
}
</style>