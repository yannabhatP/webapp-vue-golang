<script >

  import IconCart from './components/icons/IconCart.vue';
  import IconSearch from './components/icons/IconSearch.vue';
  import IconAccount from './components/icons/IconAccount.vue';
  export default{
    components:{
      IconAccount,
      IconSearch,
      IconCart
    }
  }
</script>    

<template>
  <div>
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
              <router-link to="/slim" class="nav-link">
                <IconCart/>
              </router-link>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <router-view></router-view>
    <div class="fixed-bottom bg-light">
      <div class="container-fluid">
        <p class="navbar-brand" >© 2022 Keychron Thailand | Wireless Mechanical Keyboards for Mac, Windows and Android</p>
      </div>
    </div>
  </div>
  
  <!-- <div class="card flex-column "> 
    <div class="card-header p-0 justify-content-start"> 
      <nav class="navbar navbar-light bg-light flex-nowrap flex-row">
        <div class="d-flex ms-5 align-items-center float-left" >
            <router-link to="/product" class="navbar-brand fs-4 fw-bold font-oblique">Keychron Store by Tim</router-link>
            <ul class="nav navbar-nav flex-row">
              <li class="nav-item p-2">
                <router-link to="/default" class="nav-link">Products</router-link>
              </li>
              <li class="nav-item p-2">
                <router-link to="/slim" class="nav-link">Slim Product</router-link>
              </li>
            </ul>
          </div>
          <div class="me-4 align-items-center float-right">
            <ul class="nav navbar-nav flex-row">
              <li class="nav-item p-2">
                <router-link to="/product" class="nav-link">
                  <IconAccount/>
                </router-link>
              </li>
              <li class="nav-item p-2">
                <router-link to="/default" class="nav-link">
                  <IconSearch/>
                </router-link>
              </li>
              <li class="nav-item p-2">
                <router-link to="/slim" class="nav-link">
                  <IconCart/>
                </router-link>
              </li>
            </ul>
          </div>
      </nav>
    </div>
    <div class="card-body container mt-2">
      <router-view></router-view>
    </div>
    <nav class="navbar fixed-bottom navbar-light bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Fixed bottom</a>
      </div>
    </nav>
   <div class="justify-content-end card-footer bg-light text-muted">
      2 day ago
    </div>
  </div> -->
 
</template>