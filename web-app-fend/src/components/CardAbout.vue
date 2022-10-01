<script>
export default {
    props:{
        aboutKeyboard:Object
    }
}
</script>

<template>
    <div class="col card m-4 " style="width: 18rem;">
        <img :src="aboutKeyboard.image" class="card-img-top" alt="">
        <div class="card-body">
            <h5 class="card-title text-center">{{aboutKeyboard.head}}</h5>
            <p class="card-text">{{aboutKeyboard.description}}</p>
        </div>
    </div>
</template>
