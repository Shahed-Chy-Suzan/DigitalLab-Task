<template>
    <div>
        <ol class="breadcrumb mt-3">
			<li class="breadcrumb-item">
				<a href="#">Dashboard</a>
			</li>
			<li class="breadcrumb-item active">DigitalLab / Task</li>
		</ol>
        <div class="row justify-content-center pt-5">
            <h1 class="display-4 font-weight-bolder text-primary shadow-sm">DigitalLab</h1><br>
            <p class="text-danger">Total ICT Solution</p>
        </div>

        <vue-suggestion :items="items"
                        v-model="item"
                        :setLabel="setLabel"
                        :itemTemplate="itemTemplate"
                        @changed="inputChange"
                        @selected="itemSelected">
        </vue-suggestion>

        <div v-if="item && item.id">
            <p>Selected item:</p>
            <code>{{ item }}</code>
        </div>
  </div>
</template>

<script>
import itemTemplate from './item-template.vue';
export default {
    created(){
        this.allProduct();              //---------1--1
    },
  data () {
    return {
      item: {},
      items: [],
      itemTemplate,
    }
  },
  methods: {
    allProduct(){
        axios.get('/product')
            .then(({data}) => (this.items = data))
            .catch()
    },
    itemSelected (item) {
      this.item = item;
    },
    setLabel (item) {
      return item.product_name;
    },
    inputChange (text) {
      // your search method
      // this.items = items.filter(item => item.name.contains(text));
      this.items = this.items.filter(item => (new RegExp(text.toLowerCase())).test(item.product_name.toLowerCase()));
      // now `items` will be showed in the suggestion list
    },
  },

};
</script>
