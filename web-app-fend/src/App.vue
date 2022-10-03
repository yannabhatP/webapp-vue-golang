<script >

  import IconCart from './components/icons/IconCart.vue';
  import IconSearch from './components/icons/IconSearch.vue';
  import IconAccount from './components/icons/IconAccount.vue';
  export default{
    components:{
      IconAccount,
      IconSearch,
      IconCart
    },
    data(){
        return {
          showMenu: false
        }
    },
    methods: {
        showOffcanvasMenu(){
            this.showMenu ? this.showMenu = false : this.showMenu = true;
        }
    }
  }
</script>    

<template>
  <div tabindex="-2">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid ms-3 me-2">
        <router-link to="/" class="navbar-brand" href="#">
          <img src="https://th.manuals.plus/ezoimgfmt/manuals.plus/wp-content/uploads/2022/02/Keychron-logo-1.png?ezimgfmt=rs:505x121/rscb1/ng:webp/ngcb1" alt="" width="188" height="52">
        </router-link>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <ul class="navbar-nav me-auto ms-4 mb-2 mb-lg-0">
            <li class="nav-item">
              <router-link to="/default" class="nav-link" aria-current="page">Products</router-link>
            </li>
            <li class="nav-item">
              <router-link to="/slim" class="nav-link">Slim Product</router-link>
            </li>
          </ul>
          <ul class="d-flex navbar-nav ">
            <li class="nav-item p-2">
              <router-link to="/product" class="nav-link">
                <IconAccount/>
              </router-link>
            </li>
            <li class="nav-item p-2">
              <div  class="nav-link" @click.prevent="showOffcanvasMenu()">
                <IconCart/>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav> 
    <div class="offcanvas offcanvas-end" :class="showMenu ? 'show' : ''" tabindex="-1" :style="{ visibility: showMenu ? 'visible' : 'hidden' }">
      <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="">Offcanvas with backdrop</h5>
          <button type="button" class="btn-close text-reset" @click.prevent="showOffcanvasMenu()"></button>
      </div>
      <div class="offcanvas-body">
          <p>.....</p>
      </div>
    </div>
    <router-view></router-view>
    <div class="fixed-bottom bg-light">
      <div class="container-fluid">
        <p class="navbar-brand" >© 2022 Keychron Thailand | Wireless Mechanical Keyboards for Mac, Windows and Android</p>
      </div>
    </div>
  </div>
</template>