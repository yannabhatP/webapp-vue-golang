import { createWebHistory, createRouter } from "vue-router";

import Home from "@/components/Home.vue";
import AllProduct from "@/components/AllProduct.vue";
import Product from "@/components/Product.vue";
import SlimProduct from "@/components/SlimProduct.vue";



const routes = [
  {
    path: "/",
    component: Home,
  },
  {
    path: "/all-product",
    component: AllProduct,
  },
  {
    path: "/product",
    component: Product,
  },
  {
    path: "/slim-product",
    component: SlimProduct,
  },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
  });

export default router;