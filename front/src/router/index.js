import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
//import Forum from '../views/Forum'
import Sommaire from '../views/Sommaire'
import Messageforum from '../views/Messageforum'
import Chat from '../views/Chat'
import Market from '../views/Market'
import Statistic from '../views/Statistic'
import Test from '../views/Test'
import Annonce from '../views/Annonce'


Vue.use(VueRouter)

  const routes = [
    
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/vous-etes-ici/',
    name: 'Sommaire',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    //component: () => import(/* webpackChunkName: "about" */ '../views/Sommaire.vue')
    component: Sommaire
  },
  {
    path: '/zi-forum',
    name: 'Forum',
    component: ()=> import('../views/Forum')
  },
  {
    path: '/voir-un-message',
    name: 'Messageforum',
    component: Messageforum
  },
  {
    path: '/chat-live',
    name: 'Chat',
    component: Chat
  },
  {
    path: '/market-place',
    name: 'Market',
    component: Market
  },
  {
    path: '/voir-une-annonce',
    name: 'Annonce',
    component: Annonce
  },
  {
    path: '/stat',
    name: 'Statistic',
    component: Statistic
  },
  {
    path: '/test',
    name: 'Test',
    component: Test
  }
]

const router = new VueRouter({

  routes
})

export default router
