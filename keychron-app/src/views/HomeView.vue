<script>
import CarouselVue from '../components/Carousel.vue';
import CardTypeVue from '../components/CardType.vue';

import CardAboutVue from '../components/CardAbout.vue';
export default {
  components:{
    CarouselVue,
    CardTypeVue,
    CardAboutVue
  },
  data() {
    return {
      carousalData:[
        {"id":1,"name":"Keychron K1 SE Wireless Mechanical Keyboard","class":"carousel-item active","description":"การผสมผสานฟีเจอร์ hot-swappable เข้ากับ low profile Gateron switch เพื่อมอบอิสระในการปรับแต่งประสบการณ์การพิมพ์แต่ละปุ่มได้อย่างง่ายดาย มาพร้อมกับซิกเนเจอร์ฟีเจอร์ทั้งหมดของ Keychron","image":"https://cdn.shopify.com/s/files/1/0328/6034/0364/t/4/assets/k1se_01-1642418790850.jpg?v=1642418794"},
        {"id":2,"name":"KEYCHRON V1","class":"carousel-item","description":"V1 เป็นแมคคานิคอลคีย์บอร์ดที่คัสต้อมได้อย่างเต็มที่และพร้อมสำหรับทุกสถานการณ์ นี่คือตัวเลือกที่ยอดเยี่ยมที่จะพาคุณก้าวเข้าสู่โลกของคัสต้อมคีย์บอร์ด ด้วยขนาด 75% ที่กะทัดรัด การรองรับ QMK/VIA มาพร้อมแผ่นซิลิโคนกันเสียง และคีย์แคป PBT แบบ double-shot V1 ถูกออกแบบมาเพื่อมอบความสะดวกสบายในการพิมพ์เป็นพิเศษและเพิ่มความโปรดักทีฟขั้นสุด","image":"https://cdn.shopify.com/s/files/1/0328/6034/0364/t/4/assets/keychronv1qmkcustommechanicalkeyboardfrostedblackversiontranslucent-1663222027802.jpg?v=1663222029"},
        {"id":3,"name":"Keychron K5 Ultra-Slim Wireless Mechanical Keyboard","class":"carousel-item","description":"K5 มาพร้อมคีย์แคปสำหรับระบบปฏิบัติการ Windows และ Macแมคคานิคอลคีย์บอร์ดไร้สายบางเฉียบขนาด Full size พร้อมปุ่ม Numpad","image":"https://cdn.shopify.com/s/files/1/0328/6034/0364/t/4/assets/keychronk5wiredwirelessmechanicalkeyboardlowprofileultraslimopticalgateronswitchesedited1636681124160-1660038188326.jpg?v=1660038191"}
    ],
      keyType:[
        {"id":1,"name":"Normal Keyboard","image":"https://cdn.shopify.com/s/files/1/0328/6034/0364/t/4/assets/normal-keyboard-1662798229198.jpg?v=1662798235"},
        {"id":2,"name":"Slim Keyboard","image":"https://cdn.shopify.com/s/files/1/0328/6034/0364/t/4/assets/slim-keyboard-1662798246005.jpg?v=1662798252"}
    ],
      aboutKey:[
        {"id":1,"head":"Wireless & Wired","description":"เชื่อมต่อผ่านระบบ Bluetooth ได้สูงสุด 3 อุปกรณ์ และใช้งานผ่าน Type-C cable ได้","image":"https://cdn.shopify.com/s/files/1/0328/6034/0364/t/4/assets/bluetoothtypec-1632905449443.png?v=1632905450"},
        {"id":2,"head":"Compatible With All Devices","description":"สามารถใช้งานได้ร่วมกับหลากหลายระบบปฏิบัติการ ทั้ง macOS, Windows, iOS, Android และ Linux","image":"https://cdn.shopify.com/s/files/1/0328/6034/0364/t/4/assets/-1634807604438.png?v=1634807605"}
    ],
      hrefPage:["/default","/slim"]
    }
  }
}
</script>

<template>
  <div class="container-fluid mb-5">
    <div class="row">
      <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <CarouselVue
            v-for="item in carousalData"
            :carousal="item"
            :key="item.id"
          />
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
       
      </div>
    </div>
    <div class="row ">
      <CardTypeVue
        v-for=" (item1,i) in keyType"
        :typeKeyboard="item1"
        :key="item1.id"
        :page="hrefPage[i]"
      /> 
    </div>
    <div class="row ">
      <CardAboutVue
        v-for="item2 in aboutKey"
        :aboutKeyboard="item2"
        :key="item2.id"
      />
    </div>
    
  </div>
   
  
</template>

<style>

</style>