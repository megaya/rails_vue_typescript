import Vue from 'vue'
import Router from 'vue-router'
import SignInView from '../components/templates/SignInView.vue'
import UserShow from '../components/templates/UserShowView.vue'

const routes = [{
  path: '/',
  component: SignInView,
}, {
  name: 'sign_in',
  path: '/sign_in',
  component: SignInView
}, {
  name: 'user',
  path: '/user/',
  component: UserShow
}, {
  path: '*',
  redirect: '/'
}]

Vue.use(Router)
const router = new Router({ routes })
export default router