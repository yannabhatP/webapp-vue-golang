<script>
    import axios from 'axios'
    export default {
      data() {
        return {
          keyboard:[]
        }
      },
      created(){
        this.fetchData()
      },
      methods:{
        async fetchData(){
          const url ="http://localhost:8080/normal"
          await axios.get(url).then(res =>{

              this.keyboard = res.data
            }
          ).catch(err => console.log(err))
        }
      }
    }
</script>
    
<template>
     <ul>
        <template v-for="item in keyboard">
            <li>
              <div class="card flex-row m-3 p-2" >
                <img v-bind:src="item.image" class="img-thumbnail">
                <div class="card-body">
                  <h5 class="card-title">{{item.name}}</h5>
                  <p class="card-text">{{'price = '+item.price}}</p>
                </div>
              </div>
            </li>
        </template>
      </ul>
</template>