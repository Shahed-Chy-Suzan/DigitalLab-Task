
import home from './components/home.vue'
import product from './components/product.vue'
import digitalLab from './components/digitalLab.vue'
import invoice from './components/invoice.vue'
import loop from './components/loop.vue'

export const routes = [
    { path: '/', component: home, name: '/' },
    { path: '/product', component: product, name: 'product' },
    { path: '/digitalLab', component: digitalLab, name: 'digitalLab' },
    { path: '/invoice', component: invoice, name: 'invoice' },
    { path: '/loop', component: loop, name: 'loop' }
]
