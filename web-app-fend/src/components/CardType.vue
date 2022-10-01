<script>
export default {
    props:{
        typeKeyboard:Object
    }
}
</script>

<template>
    <div class="col card m-4 " style="width: 18rem;">
        <img :src="typeKeyboard.image" class="card-img-top" alt="">
        <div class="card-body">
            <h5 class="card-title text-center">{{typeKeyboard.name}}</h5>
        </div>
    </div>     
</template>
