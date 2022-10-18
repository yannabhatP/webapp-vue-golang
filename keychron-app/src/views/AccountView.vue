<template>
  <div class="container center">
    <div class="row">
      <div class="col">
        <h2 class="text-xl">Order History</h2>
        <div v-if="!his">
          <h4>You haven't placed any orders yet</h4>
        </div>
        <div v-else>
          <h4>You placed any orders </h4>
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
        his:null
      }
    },
    created(){
      (!profile.account) ? this.$router.push('/login')
      : this.profileAcc = profile.account
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