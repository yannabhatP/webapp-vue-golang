<template>
  <div class="container center">
    <div class="row">
      <div class="col">
        <h2 class="text-xl">Order History</h2>
        <div v-if="!his">
          <h4>You haven't placed any orders yet</h4>
        </div>
        <div v-else>
          
          <div class="row border-top border-bottom" v-for="(item,i) in his" :key="i">
            <div class="col">
              <p>{{item.time}}</p>
            </div>
            <div v-for=" (item2,j) in JSON.parse(item.o_detail)" :key="j">
              <div class="row main align-items-center">
                <div class="col-2"><img class="img-fluid" :src="item2.p_image"/></div>
                  <div class="col">
                    <div class="row ">{{item2.p_name}}</div>
                    <p class="row text-muted">{{"color: "+item2.p_color }}<br/>{{"switch: "+item2.p_switch}}<br/>{{"lang: "+item2.p_lang}}</p>
                  </div>
                  <div class="col">
                    <a href="#" >-</a><a href="#" class="border">{{item2.p_quatity}}</a><a href="#">+</a>
                  </div>
                <div class="col">{{item2.p_price*item2.p_quatity}} ฿</div>
              </div>
            </div>
          </div> 
        </div>
      </div>
      <div class="col">
        <h2 class="text-xl">My account</h2>
        <p v-on:click="logout()">Log out</p>
      </div>
      <div class="col">
        <h2 class="text-xl">Account Details</h2>
        <h5 class="text-xl">{{profileAcc.fname}} {{profileAcc.lname}}</h5>
        <p class="text-x">Your Address</p>
        <p>address 1 : {{profileAcc.address}}</p>
      </div>
    </div>
    
    
  </div>
</template>

<script>
  import {profile} from '../store/profile.js'
  export default {
    data(){
      return{
        profileAcc:{},
        profile,
        his:null,
        product:[]
      }
    },
    created(){
      (!profile.account) ? this.$router.push('/login')
      : this.profileAcc = profile.account
      // console.log(this.profileAcc)
      const {email} = this.profileAcc
      this.axios.get(`http://localhost:8080/order/${email}`)
      .then(res=>this.his = res.data)
      .catch(err=>alert(err))
      
    },
    methods:{
      logout: function(){
        profile.logout()
        this.$router.push('/login')
      }
    }
  }
</script>

<style>

</style>