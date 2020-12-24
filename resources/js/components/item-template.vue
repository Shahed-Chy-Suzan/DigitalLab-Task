<template>
  <div>
    <!-- <b>#{{ item.id }}</b> -->
    <span><b>{{ item.product_name }}</b></span><br>
    <span>price: {{ item.product_price }}</span><br>
    <span>Category: {{ item.name_category }}</span>
  </div>
</template>

<script>
export default {
  props: {
    item: { required: true },
  }
}
</script>
