
import home from './components/home.vue'
import product from './components/product.vue'
import invoice from './components/invoice.vue'

export const routes = [
    { path: '/', component: home, name: '/' },
    { path: '/product', component: product, name: 'product' },
    { path: '/invoice', component: invoice, name: 'invoice' }
]
