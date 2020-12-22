
require('./bootstrap');

import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)


//------Reload-----
window.Reload = new Vue();

//----Vue-suggestion------
import VueSuggestion from 'vue-suggestion'
Vue.use(VueSuggestion)

//------routes-------
import {routes} from './routes';

const router = new VueRouter({
    routes,
    // mode: 'history'
})

const app = new Vue({
    el: '#app',
    router
});
