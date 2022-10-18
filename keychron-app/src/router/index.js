import { createRouter, createWebHistory } from 'vue-router'
import Home from "../views/HomeView.vue";
import Product from "../views/ProductView.vue";
import Default from "../views/DefaultProductView.vue";
import Slim from "../views/SlimProductView.vue";
import Keyboard from "../views/KeyboardView.vue";
import CheckOut from "../views/CheckOutView.vue";

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
    path: '/login',
    name: 'login',
    component: ()=> import('../views/LoginView.vue')
  },
  {
    path: '/register',
    name: 'register',
    component: ()=> import('../views/RegisterVue.vue')
  },
  {
    path: '/account',
    name: 'account',
    component: ()=> import('../views/AccountView.vue')
  },
  {
    path: '/:pathMatch(.*)*',
    name: 'notfound',
    component: ()=> import('../views/NotFoundView.vue')
  },
  
  
  
  
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
