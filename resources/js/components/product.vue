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
            <div class="card col-lg-6 border-primary shadow">
                <div class="card-header text-primary">
                    <i class="fas fa-chart-area"></i>
                    <b>Expense Details</b>
                </div>

                <div class="card-body">
                    <table class="table table-sm table-striped">
                        <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Qty</th>
                            <th scope="col">Price/Unit</th>
                            <th scope="col">Total</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>                 <!------Expense_Insert_Table(Top_Left)--------->
                        <tr v-for="card in cards" :key="card.id">       <!-------pos_table---------3----->
                            <th>{{ card.pro_name }}</th>
                            <td><input type="text" readonly="" style="width: 20px;" :value="card.pro_quantity">

                                <button @click.prevent="increment(card.id)" class="btn btn-sm btn-success">+</button>

                                <button @click.prevent="decrement(card.id)" class="btn btn-sm btn-danger" v-if="card.pro_quantity >= 2">-</button>      <!----------------->
                                <button class="btn btn-sm btn-danger" v-else="" disabled="">-</button>  <!-------------->

                            </td>
                            <td>{{ card.product_price }}</td>
                            <td>{{ card.sub_total }}</td>
                            <td><a @click="removeItem(card.id)" class="btn btn-sm btn-danger text-white">x</a></td>
                        </tr>

                        </tbody>
                    </table>
                    <hr>
                </div>
                <div class="card-footer">       <!-----Expense_Insert_Table(Middle_Left)------->
                    <ul class="list-group">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Total Quantity:
                            <strong>{{ qty }}</strong>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Sub Total:
                            <strong>{{ subtotal }} Tk</strong>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Discount:
                            <!-- <strong> {{ discount }} % </strong> -->
                            <strong> <input type="text" style="width: 30px;" v-model="discount"> <span>%</span> </strong>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Discount Price:
                            <strong> {{ subtotal*discount/100 }} Tk</strong>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Total:
                            <!-- <strong> {{ subtotal*vats.vat /100 +subtotal }} Tk</strong> -->
                            <strong> {{ subtotal-(subtotal*discount/100) }} Tk</strong>
                        </li>
                    </ul>
                    <br>                   <!-----Expense_Insert_Table(Bottom_Left)------>
                    <form @submit.prevent="orderdone">          <!--------------2----------------->
                        <label>Paying Amount</label>
                        <input type="text" class="form-control" required v-model="pay">

                        <label>Due</label>                              <!---------"due" dynamic kora hoyeche------------>
                        <!-- <input type="text" class="form-control" required v-model="due"> -->
                        <input type="text" class="form-control" required :value="((subtotal-(subtotal*discount/100)) - pay).toFixed(2)">

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
            <div class="card col-lg-6 border-primary">
                <div class="card-header text-primary">
                    <i class="fas fa-chart-area"></i>
                    <b>Products</b>
                </div>

                <div class="card-body">
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                            <!-----Search----->
                            <input type="text" v-model="searchTerm" class="form-control" placeholder="Search with Product Name..."><br>
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-6" v-for="product in filtersearch" :key="product.id">
                                    <button class="btn btn-sm" @click.prevent="AddToCart(product.id)">  <!--------3------->
                                        <div class="card border-primary shadow-sm" style="width: 9rem; height: 130px;">
                                            <div class="card-body">
                                                <span class="card-title font-weight-bolder">{{ product.product_name }}</span><br>
                                                <!-- <span class="text-danger d-block pt-3" v-if="product.discount">Discount : {{ product.discount }} %</span><br> -->
                                                <span class="text-primary d-block m-0 pt-3"> BDT: {{product.product_price}}</span>
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Icon Cards-->
    </div>
</template>


<script>
    export default {
        created(){
            this.allProduct();              //---------1--1
            // this.allCategory();      //---------1--
            // this.allCustomer();     //--------2---
            this.cartProduct();             //--------3--2
            // this.vat();
            Reload.$on('AfterAdd', ()=>{        //--------3.2--
                this.cartProduct();
            });
        },
        data(){
            return{
                // form:{                   //------2---
                //     // details :'',
                //     // amount:'',
                //     name :'',
                //     email :'',
                //     address:'',
                //     photo :'',
                //     phone:'',
                // },
                // customer_id:'',     //--customer_form-
                pay:'',
                discount:'',
                // due:'',
                payby:'',
                products:[],                //---------1---1.2
                // categories:'',     //---------1---
                // getproducts:[],    //---------1---
                searchTerm:'',        //---------1---
                // getsearchTerm:'',  //---------1---
                // customers:'',      //-------2---
                errors:'',            //---------1---
                cards:[],                   //--------2.2--
                // vats:''
            }
        },
        computed:{
            filtersearch(){                          //----------------1.3-------
                return this.products.filter(product => {
                    return product.product_name.match(this.searchTerm)
                })
            },
            qty(){
                let sum=0;
                for(let i=0; i < this.cards.length; i++ ){
                    sum += (parseFloat(this.cards[i].pro_quantity));
                }
                return sum;
            },
            subtotal(){
                let sum=0;
                for(let i=0; i < this.cards.length; i++){
                    sum += (parseFloat(this.cards[i].pro_quantity) * parseFloat(this.cards[i].product_price));
                }
                return sum;
            },
        },
        methods:{
            //--start cart methods--                //------------------3.1----
            AddToCart(id){
                axios.get('/addTocart/'+id)
                    .then(() => {
                        Reload.$emit('AfterAdd');
                    })
            },
            cartProduct(){                                  //------------2.1----3.3
                axios.get('/cart/product')
                    .then(({data}) => (this.cards = data))
                    .catch()
            },
            removeItem(id){
                axios.get('/remove/cart/'+id)
                    .then(() => {
                        Reload.$emit('AfterAdd');
                    })
            },
            increment(id){              //------------------4----
                axios.get('/increment/'+id)
                    .then(() => {
                        Reload.$emit('AfterAdd');
                    })
            },
            decrement(id){
                axios.get('/decrement/'+id)
                    .then(() => {
                        Reload.$emit('AfterAdd');
                    })
            },
            allProduct(){                                         //------------1---1.1
                axios.get('/product')
                    .then(({data}) => (this.products = data))
                    .catch()
            },

            // vat(){
            //     axios.get('/vats')
            //         .then(({data}) => (this.vats = data))
            //         .catch()
            // },
            orderdone(){
                let total = this.subtotal-(this.subtotal*this.discount/100)
                let due = ((this.subtotal-(this.subtotal*this.discount/100)) - this.pay).toFixed(2);  //variable.toFixed(2)=take 2 specified decimal number
                var data = {qty:this.qty, sub_total:this.subtotal, discount:this.discount, pay_by:this.payby, deposit:this.pay, due:due, total:total}       //due:this.due //due_dynamic

                axios.post('/orderdone/',data)
                .then(()=>{
                    this.$router.push({ name: 'invoice'})
                })
            },
            //---End_cart_methods----


            // allCategory(){                                       //-------------1---
            //     axios.get('/api/category/')
            //         .then(({data}) => (this.categories = data))
            //         .catch()
            // },
            // allCustomer(){                              //------2----
            //     axios.get('/api/Customer/')
            //         .then(({data}) => (this.customers = data))
            //         .catch()
            // },
            // subproduct(id){                                      //-------------1---
            //     axios.get('/api/getting/product/'+id)
            //         .then(({data}) => (this.getproducts = data))
            //         .catch(error => this.errors = error.response.data.errors)
            // },
            //---image validationmethod---
            // onFileselected(event){                  //------------2----
            //     let file=event.target.files[0];
            //     if (file.size > 1048770) {
            //         Notification.image_validation()
            //     }else{
            //         let reader = new FileReader();
            //         reader.onload = event => {
            //             this.form.photo = event.target.result

            //             console.log(event.target.result);
            //         };
            //         reader.readAsDataURL(file);
            //     }
            // },
            // customerInsert(){                   //-------------2---
            //     axios.post('/api/Customer/',this.form)
            //         .then(() => {
            //             $('#closeModal').click();
            //             Reload.$emit('customerReload');
            //             Notification.success()
            //             // this.customers = this.customers.filter(customer =>{   //--Or-/use Reload--
            //             //     return customer.id !=id
            //             // })
            //         })
            // }
        }
    }
</script>


<style scoped>
    #add_new{
        float: right;
    }
    #em_photo{
        height: 100px;
        width: 90px;
    }
</style>
