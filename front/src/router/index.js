import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Forum from '../views/Forum'
import Sommaire from '../views/Sommaire'

Vue.use(VueRouter)

  const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/sommaire/',
    name: 'Sommaire',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    //component: () => import(/* webpackChunkName: "about" */ '../views/Sommaire.vue')
    component: Sommaire
  },
  {
    path: '/forum',
    name: 'Forum',
    component: Forum
    //component: ()=> import('../views/Forums')
  }
]

const router = new VueRouter({
  routes
})

export default router
