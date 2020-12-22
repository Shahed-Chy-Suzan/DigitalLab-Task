
<template>
    <div>
        <!-- Breadcrumbs-->
        <ol class="breadcrumb mt-3">
            <li class="breadcrumb-item">
                <a href="#">DigitalLab</a>
            </li>
            <li class="breadcrumb-item active">Product / Product Sale and Calculation</li>
        </ol>

        <div class="row mb-4">
    <!--------------------------Left_Side_"Expense Insert"------------2nd_task----------->
            <div class="card col-lg-7 border-primary shadow">
                <div class="card-header text-primary">
                    <i class="fas fa-chart-area"></i>
                    <b>Expense Details</b>
                </div>

                <div class="card-body">
                    <table class="table table-sm table-striped">
                        <thead>
                        <tr>
                            <th scope="col">Sl No</th>
                            <th scope="col">Name</th>
                            <th scope="col">Qty</th>
                            <th scope="col">Price/Unit</th>
                            <th scope="col">Total</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>                 <!------Expense_Insert_Table(Top_Left)--------->
                        <tr v-for="(card,index) in cards" :key="card.id">       <!-------pos_table---------3----->
                            <td> {{index+1}} </td>
                            <th>{{ card.product_name }}</th>
                            <td><input type="number" min="1" style="width: 40px;" v-model="card.product_quantity" required>
                            </td>
                            <!-- <td>{{ card.product_price }}</td> -->
                            <td><input type="number" min="1" style="width: 70px;" v-model="card.product_price" required>
                            </td>
                            <td>{{ card.product_price*card.product_quantity }}</td>
                            <td><a @click="removeProduct(index)" class="btn btn-sm btn-danger text-white">x</a></td>
                        </tr>
                        </tbody>
                    </table>
                    <hr>
                </div>
                <div class="card-footer">       <!-----Expense_Insert_Table(Middle_Left)------->
                    <ul class="list-group">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Total Quantity:
                            <strong>{{ totalQuantity }}</strong>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Sub Total:
                            <strong>{{ subtotal }} Tk</strong>
                            <!-- <strong>{{ subtotal }} Tk</strong> -->
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Discount:
                            <strong> <input type="number" min="0" style="width: 45px;" v-model="discount"> <span>%</span> </strong>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Discount Price:
                            <strong> {{ (subtotal*discount)/100 }} Tk</strong>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Total:
                            <!-- <strong> {{ subtotal*vats.vat /100 +subtotal }} Tk</strong> -->
                            <strong> {{ subtotal-(subtotal*discount)/100 }} Tk</strong>
                        </li>
                    </ul>
                    <br>                   <!-----Expense_Insert_Table(Bottom_Left)------>
                    <form @submit.prevent="orderdone">
                        <label>Paying Amount</label>
                        <input type="text" class="form-control" required v-model="pay">

                        <label>Due</label>
                        <!-- <input type="text" class="form-control" required v-model="due"> -->
                        <input type="text" class="form-control" required :value="((subtotal-(subtotal*discount)/100) - pay).toFixed(2)">

                        <label>Pay By</label>
                        <select class="form-control" v-model="payby">
                            <option value="HandCash">Hand Cash</option>
                            <option value="Cheaque">Cheaque</option>
                            <option value="GiftCard">Gift Card</option>
                        </select>

                        <br>
                        <button type="submit" class="btn btn-success mb-4">Submit</button>
                    </form>
                </div>
            </div>


<!--------------Right_Side_"Product"----------1st_task----------1----->
            <div class="card col-lg-5 border-primary">
                <div class="card-header text-primary">
                    <i class="fas fa-chart-area"></i>
                    <b>Products</b>
                </div>

                <div class="card-body">             <!----------------------------->
                    <div class="mb-5 pb-5 mt-2">
                        <vue-suggestion :items="items"
                                v-model="item"
                                :setLabel="setLabel"
                                :itemTemplate="itemTemplate"
                                @changed="inputChange"
                                @selected="itemSelected">
                        </vue-suggestion>

                        <!-- <div v-if="item && item.id">
                            <p>Selected item:</p>
                            <code>{{ item }}</code>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Icon Cards-->
    </div>
</template>


<script>
import itemTemplate from './item-template.vue';
    export default {
        created(){
            this.newAllProduct();           //----------------------------------//------
        },
        data(){
            return{
                pay:'',
                discount:'',
                payby:'',
                cards:[],                   //--------2.2--

                item: {},   //-----------------------------------------------------//----
                items: [],
                itemTemplate,
            }
        },
        computed:{
            totalQuantity(){
                let sum=0;
                for(let i=0; i < this.cards.length; i++ ){
                    sum += (parseFloat(this.cards[i].product_quantity));
                }
                return sum;
            },
            subtotal(){
                let sum=0;
                for(let i=0; i < this.cards.length; i++){
                    sum += (this.cards[i].product_quantity)*parseFloat(this.cards[i].product_price);
                }
                return sum;
                //--or use "reduce()" js_function here
            },
        },
        methods:{
            newAllProduct(){                               //---------------------------//------------
                axios.get('/product')
                    .then(({data}) => (this.items = data))
                    .catch()
            },
            itemSelected (item) {
                this.item = item;
                this.cards.push(item);
            },
            setLabel (item) {
                return item.product_name;
            },
            inputChange (text) {
                // your search method
                // this.items = items.filter(item => item.product_name.contains(text));

                this.items = items.filter(item => (new RegExp(text.toLowerCase())).test(item.product_name.toLowerCase()));

                // this.newAllProduct();
                // now `items` will be showed in the suggestion list
            },
            removeProduct(index){
                this.cards.splice(index,1)
            },
            orderdone(){
                let subtotal = this.subtotal
                let total = subtotal-(subtotal*this.discount)/100
                let due = (total - this.pay).toFixed(2);  //variable.toFixed(2)=take 2 specified decimal number
                var data = {
                    qty: this.totalQuantity,
                    sub_total: subtotal,
                    discount: this.discount,
                    pay_by: this.payby,
                    deposit: this.pay,
                    due: due,
                    total: total
                }       //due:this.due //due_dynamic

                axios.post('/orderdone/',data)
                .then(()=>{
                    this.$router.push({ name: 'invoice'})
                })
            },

        },
    }
</script>


<style scoped>

</style>
