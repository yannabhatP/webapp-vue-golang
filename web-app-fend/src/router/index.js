import { createWebHistory, createRouter } from "vue-router";
import Home from "@/views/HomeView.vue";
import Product from "@/views/ProductView.vue";
import Default from "@/views/DefaultProductView.vue";
import Slim from "@/views/SlimProductView.vue";


const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },
  {
    path: '/product',
    name: 'product',
    component: Product
  },
  {
    path: '/default',
    name: 'default',
    component: Default
  },
  {
    path: '/slim',
    name: 'slim',
    component: Slim
  },
  
  
  
];

const router = createRouter({
    history: createWebHistory(),
    routes,
  });

export default router;