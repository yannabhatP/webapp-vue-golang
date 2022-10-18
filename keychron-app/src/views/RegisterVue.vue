<script>
  export default {
    data(){
      return{
        email:'',
        password:'',
        fname:'',
        lname:'',
        address:''
      }
    },
    methods:{
      registerAccount(){
        
        const person= {
          email:this.email,
          password:this.password,
          fname:this.fname,
          lname:this.lname,
          address:this.address
        }
        this.axios.post('http://localhost:8080/person',person)
        .then(res=>{this.$router.push('/login')})
        .catch(err=>alert(err))

      }

    }
  }
</script>
<template>
  <div class="container mt-3 center">
    <h1 class="text-center text-xl mt-5 ">Register</h1>
    <div class="container center mb-5 mt-5 w-50" >
        <div class="col form-floating mb-3">
            <input type="email" class="form-control" id="floatingInput" v-model="email" placeholder="name@example.com" required>
            <label for="floatingInput">Email address</label>
        </div>
        <div class="col form-floating mb-3">
            <input type="password" class="form-control" id="floatingPassword" v-model="password" placeholder="Password" required>
            <label for="floatingPassword">Password</label>
        </div>
        <div class="col form-floating mb-3">
            <input type="text" class="form-control" id="floatingFirstname" v-model="fname" placeholder="Username" required>
            <label for="floatingFirstname">First Name</label>
        </div>
        <div class="col form-floating mb-3">
            <input type="text" class="form-control" id="floatingLastname" v-model="lname" placeholder="Username" required>
            <label for="floatingLastname">Last Name</label>
        </div>
        
        <div class="mb-3">
          <label for="exampleFormControlTextarea1" class="form-label">Address</label>
          <textarea class="form-control" id="exampleFormControlTextarea1" v-model="address" rows="3"></textarea>
        </div>
        <div class="d-grid ">
            <button class="btn btn-primary text-uppercase" @click="registerAccount">sign up</button>
        </div>
        <hr/>
    </div>
    
  </div>
</template>

<style>

</style>