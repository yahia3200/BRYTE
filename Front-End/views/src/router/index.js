import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Hello from '../views/HelloWorld.vue'
const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/Hello',
    name: 'Hello',
    component: Hello
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
