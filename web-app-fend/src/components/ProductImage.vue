<script>
export default {
    props:{
        product:Object
    }
}
</script>

<template>
    <div>
        <div class="m-3">
            <img :src="product.image"  class="card-img-top" />
        </div>
    </div>
</template>

<style>

</style>