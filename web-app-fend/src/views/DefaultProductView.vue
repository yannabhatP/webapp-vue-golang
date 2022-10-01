<script>
    import CardVue from '@/components/CardProduct.vue'
    import axios from 'axios'
    export default {
        components: {
            CardVue
        },
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
    <div class="container">
        <div class="row row-cols-3">
            <CardVue
                v-for="( item,i) in keyboard"
                :data="item"
                :key="i"
            />
        </div>
    </div>
</template>

<style>

</style>