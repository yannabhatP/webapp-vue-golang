<script setup>

  import IconCart from './components/icons/IconCart.vue';
  import IconSearch from './components/icons/IconSearch.vue';
  import IconAccount from './components/icons/IconAccount.vue';

</script>    

<template>
  <div class="card flex-column "> 
    <div class="card-header p-0 justify-content-start"> 
      <nav class="navbar navbar-light bg-light flex-nowrap flex-row">
        <div class="d-flex ms-5 align-items-center float-left" >
            <router-link to="/all-product" class="navbar-brand fs-4 fw-bold font-oblique">Keychron Store by Tim</router-link>
            <ul class="nav navbar-nav flex-row">
              <li class="nav-item p-2">
                <router-link to="/product" class="nav-link">Products</router-link>
              </li>
              <li class="nav-item p-2">
                <router-link to="/slim-product" class="nav-link">Slim Product</router-link>
              </li>
            </ul>
          </div>
          <div class="me-4 align-items-center float-right">
            <ul class="nav navbar-nav flex-row">
              <li class="nav-item p-2">
                <router-link to="/all-product" class="nav-link">
                  <IconAccount/>
                </router-link>
              </li>
              <li class="nav-item p-2">
                <router-link to="/product" class="nav-link">
                  <IconSearch/>
                </router-link>
              </li>
              <li class="nav-item p-2">
                <router-link to="/slim-product" class="nav-link">
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
   
    <div class="justify-content-end card-footer bg-light text-muted">
      2 day ago
    </div>
  </div>
 
</template>