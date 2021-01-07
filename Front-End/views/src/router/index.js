import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue' 
import SignUp1 from '../views/SignUp1.vue'
const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/Login',
    name:'Login',
    component: Login
  },
  {
    path: '/SignUp1',
    name:'SignUp1',
    component: SignUp1
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
