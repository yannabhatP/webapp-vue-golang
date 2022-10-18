<script>
export default {
    props:{
        carousal:Object
    }
}
</script>

<template>
    <div :class="carousal.class" >
        <img :src="carousal.image" class="d-block w-100" height="620">
        <div class="carousel-caption d-none d-md-block">
            <h5>{{carousal.name}}</h5>
            <p>{{carousal.description}}</p>
        </div>
    </div>
</template>
    
<style>

</style>