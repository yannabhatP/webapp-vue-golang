<script>
export default {
    data(){
        return{
            color:[
                {hex:"#A9A9A9",name:"Dark Gray"},
                {hex:"#D3D3D3",name:"Light Gray"}
            ],
            swit:[
                {name:"Red",color:'red'},
                {name:"Brown",color:'brown'},
                {name:"Blue",color:'blue'}
            ],
            lang:["Thai","English"]
        }
    }
}
</script>

<template>
    <div class="container-fluid" style="background-color:#white;padding:15px;">
        <div class="row">
            <div class="col-lg-2 order-lg-1 order-2">
                <ul>
                    <li class="m-3">
                        <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1565713229/single_4.jpg" width="150px" height="150px" alt="">
                    </li>
                    <li class="m-3">
                        <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1565713228/single_2.jpg" width="150px" height="150px" alt="">
                    </li>
                    <li class="m-3">
                        <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1565713228/single_3.jpg" width="150px" height="150px" alt="">
                    </li>
                </ul>
            </div>
            <div class="col-lg-4 order-lg-2 order-1 ">
                <div class="m-3"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1565713229/single_4.jpg" width="450px"  height="450px" alt=""></div>
            </div>
            <div class="col-lg-6 order-3">
                <div class="m-3">
                    <h3>Keychron K1 SE</h3>
                    <h5>4390 ฿</h5>
                    <p>Tax included</p>
                    <hr/>
                    <div class="container m-2">
                        <div class="row">
                            <label>Color</label><br/>
                            <div class="column m-2">
                                <input type="checkbox" class="btn-check" id="btn-check" autocomplete="off">
                                <label class="btn m-1" style="background-color:#A9A9A9;" for="btn-check">Dark Grey</label>
                                <input type="checkbox" class="btn-check " id="btn-check" autocomplete="off">
                                <label class="btn m-1" style="background-color:#D3D3D3;" for="btn-check">Light Grey</label>
                            </div>
                        </div>
                    </div>
                    <div class="container m-2">
                        <div class="row">
                            <label>Switch</label><br/>
                            <div class="column m-2">
                                <input type="checkbox" class="btn-check" id="btn-check" autocomplete="off">
                                <label class="btn m-1" style="background-color:red;" for="btn-check">Red</label>
                                <input type="checkbox" class="btn-check " id="btn-check" autocomplete="off">
                                <label class="btn m-1" style="background-color:brown;" for="btn-check">Brown</label>
                                <input type="checkbox" class="btn-check " id="btn-check" autocomplete="off">
                                <label class="btn m-1" style="background-color:blue;" for="btn-check">Blue</label>
                            </div>
                        </div>
                    </div>
                    <div class="container m-2">
                        <div class="row">
                            <label>Language</label><br/>
                            <div class="column m-2">
                                <input type="checkbox" class="btn-check" id="btn-check" autocomplete="off">
                                <label class="btn m-1" style="background-color:white;" for="btn-check">Thai</label>
                                <input type="checkbox" class="btn-check " id="btn-check" autocomplete="off">
                                <label class="btn m-1" style="background-color:white;" for="btn-check">English</label>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="d-grid gap-2 col-8 m-3">
                    <button class="btn btn-outline-dark" type="button">เพิ่มลงตะกร้าสินค้า</button>
                    <button class="btn btn-dark" type="button">Buy it now</button>
                </div>
            </div>
        </div>
    </div>
    
</template>

<style scoped>

</style>