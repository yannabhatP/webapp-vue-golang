<template>
  <div class="container mt-3 center">
    <h1 class="text-center text-uppercase text-xl mt-5">Login</h1>
    <form class="container center mb-5 mt-5 w-50">
        <div class="col form-floating mb-3">
            <input type="email" class="form-control" id="floatingInput" v-model="email" placeholder="name@example.com" required>
            <label for="floatingInput">Email address</label>
        </div>
        <div class="col form-floating mb-3">
            <input type="password" class="form-control" id="floatingPassword" v-model="pass" placeholder="Password" required>
            <label for="floatingPassword">Password</label>
        </div>
        <div class="d-grid ">
            <button class="btn btn-primary text-uppercase" type="button" @click="loginAccount()">Login</button>
        </div>
        <hr/>
        <p v-on:click="navigateTo('/register')">Create account</p>
    </form>
    
  </div>
</template>

<script>
import {profile} from '../store/profile.js'
    export default {
        data(){
            return{
                email:'',
                pass:'',
                profile
            }
        },
        methods:{
            navigateTo(path){
                this.$router.push(path)
            },
            loginAccount(){
                const acc = {
                    email:this.email,
                    password:this.pass
                }
                this.axios.get(`http://localhost:8080/person/${this.email}`)
                .then(res=>{
                    if(res.data.email === acc.email && res.data.password === acc.password){
                        profile.login(res.data)
                        this.$router.push('/account')
                    }
                })
                .catch(err => alert(err))
            }
        }
    }
</script>

<style>

</style>