<template>
    <div class="bg-light py-4">
    <div class="container bg-light">
        <div class="row">
            <div class="col-12">
                <!-- Main content -->
                <div class="invoice p-3 mb-3">
                    <!-- title row -->
                    <div class="row">
                    <div class="col-12">
                        <h3>
                        <i class="fa fa-globe"></i> DigitalLab
                        <small class="float-right">Date: {{orders.date}}</small>
                        </h3>
                    </div>
                    <!-- /.col -->
                    </div>
                    <!-- info row -->
                    <div class="row invoice-info">
                    <div class="col-sm-4 invoice-col">
                        From
                        <address>
                        <strong>DigitalLab</strong><br>
                        2nd floor, CPDL Paragon City,11/12 Sirajuddoullah Road,<br>
                        Anderkilla, Chittagong 4000, Bangladesh<br>
                        Phone: +88 031 2865155<br>
                        Email: info@digitallabbd.com
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        To
                        <address>
                        <strong>Sayed Arif Uddin</strong><br>
                        12 no Road, Kadalpur R/A<br>
                        Phone: (555) 539-1037<br>
                        Email: arif@gmail.com
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        <b>Invoice #007612</b><br>
                        <br>
                        <b>Order ID:</b> 4F3S8J<br>
                        <b>Payment Due:</b> {{orders.date}}<br>
                        <b>Account:</b> 968-34567
                    </div>
                    <!-- /.col -->
                    </div>
                    <!-- /.row -->

                    <!-- Table row -->
                    <div class="row py-4">
                    <div class="col-12 table-responsive">
                        <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Date</th>
                            <th>Month</th>
                            <th>Year</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>{{orders.qty}}</td>
                            <td>{{orders.total}} Tk</td>
                            <td>{{orders.date}}</td>
                            <td>{{orders.month}}</td>
                            <td>{{orders.year}}</td>
                        </tr>

                        </tbody>
                        </table>
                    </div>
                    <!-- /.col -->
                    </div>
                    <!-- /.row -->

                    <div class="row">
                    <!-- accepted payments column -->
                    <div class="col-6">
                        <p class="lead">Payment Methods:</p>
                        <img src="https://adminlte.io/themes/dev/AdminLTE/dist/img/credit/visa.png" alt="Visa">
                        <img src="https://adminlte.io/themes/dev/AdminLTE/dist/img/credit/mastercard.png" alt="Mastercard">
                        <img src="https://adminlte.io/themes/dev/AdminLTE/dist/img/credit/american-express.png" alt="American Express">
                        <img src="https://adminlte.io/themes/dev/AdminLTE/dist/img/credit/paypal2.png" alt="Paypal">

                        <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                        Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem
                        plugg
                        dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra.
                        </p>
                    </div>
                    <!-- /.col -->
                    <div class="col-6">
                        <p class="lead">Total Calculation {{orders.date}}</p>

                        <div class="table-responsive">
                        <table class="table">
                            <tbody>
                            <tr>
                                <th style="width:50%">Subtotal:</th>
                                <td>৳ {{orders.sub_total}}</td>
                            </tr>
                            <tr>
                                <th>Discount ({{orders.discount}}%)</th>
                                <td>৳ {{orders.sub_total*orders.discount/100}}</td>
                            </tr>
                            <tr>
                                <th>Total:</th>
                                <td>৳ {{orders.total}}</td>
                            </tr>
                            <tr>
                                <th>Deposit:</th>
                                <td>৳ {{orders.deposit}}</td>
                            </tr>
                            <tr>
                                <th>Due:</th>
                                <td>৳ {{orders.due}}</td>
                            </tr>
                            <tr>
                                <th>Pay By:</th>
                                <td>৳ {{orders.pay_by}}</td>
                            </tr>
                        </tbody></table>
                        </div>
                    </div>
                    <!-- /.col -->
                    </div>
                    <!-- /.row -->

                    <!-- this row will not appear when printing -->
                    <div class="row no-print">
                    <div class="col-12">

                        <a href="" @click.prevent="printme" target="_blank" class="btn btn-primary"><i class="fa fa-print"></i> Print</a>
                        <!-- <button type="button" class="btn btn-success float-right">
                            <i class="fa fa-credit-card"></i>
                            Submit Payment
                        </button> -->

                        <button type="button" class="btn btn-primary float-right" style="margin-right: 5px;">
                        <i class="fa fa-download"></i> Generate PDF
                        </button>

                    </div>
                    </div>

                </div>
                <!-- /.invoice -->
            </div>
        </div> <!-------End Row------------>
    </div>
    </div>
</template>


<script>
export default {
    created(){
        this.order();
    },
    data(){
        return{
            orders: [],
        }
    },
    methods:{
        printme() {                 //-----For Printing Invoice-----//
            window.print();
        },

        order(){
            axios.get('/invoice')
                .then(({data}) => (this.orders = data))
                .catch()
        }
    },

}
</script>

<style scoped>

</style>
