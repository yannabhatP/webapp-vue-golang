import { createWebHistory, createRouter } from "vue-router";
import Home from "@/views/HomeView.vue";
import Product from "@/views/ProductView.vue";
import Default from "@/views/DefaultProductView.vue";
import Slim from "@/views/SlimProductView.vue";
import Keyboard from "@/views/KeyboardView.vue";
import CheckOut from "@/views/CheckOutView.vue";

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
    component: Default,
    props: route => ({ query: route.query.id })
  },
  {
    path: '/slim',
    name: 'slim',
    component: Slim,
    props: route => ({ query: route.query.id })
  },
  {
    path: '/keyboard',
    name: 'keyboard',
    component: Keyboard
  },
  {
    path: '/checkout',
    name: 'checkout',
    component: CheckOut
  },
  
  {
    path: '/:pathMatch(.*)*',
    name: 'notfound',
    component: ()=> import('@/views/NotFoundView.vue')
  },
  
  
  
  
];

const router = createRouter({
    history: createWebHistory(),
    routes,
  });

export default router;