<template>
    <div class="card m-3 p-2" style="width: 18rem;">
        <img :src="data.image" class="card-img-top" />
        <div class="card-body">
            <h5 class="card-title">{{data.name}}</h5>
            <p class="card-text">{{'price:'+data.price}}</p>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        data: Object
    }
}
</script>

<style>

</style>