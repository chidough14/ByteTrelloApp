
import Vue from 'vue'
import Vuetify from 'vuetify'
import './stylus/main.styl'
import App from './App'
import router from './router'
import axios from 'axios'

window.token=localStorage.getItem('token');

window.axios=axios

window.axios.defaults.baseURL='http://localhost:8000/'
window.axios.defaults.params={api_token:window.token}
Vue.use(Vuetify)
Vue.config.productionTip = false


window.Event= new Vue;

//window.baseApiUrl="http://localhost:8000/";

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  render: h => h(App)
})
