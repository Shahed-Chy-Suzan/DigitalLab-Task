<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PosController extends Controller
{

    public function OrderDone(Request $request)
    {
        $data=array();
        // $data['customer_id']=$request->customer_id;
        // $data['product_id']=$request->product_id;
        $data['qty']=$request->qty;
        $data['sub_total']=$request->sub_total;
        $data['vat']=$request->vat;
        $data['discount']=$request->discount;
        $data['total']=$request->total;
        $data['pay_by']=$request->pay_by;
        $data['deposit']=$request->deposit;
        $data['due']=$request->due;
        $data['date']=date('d/m/Y');
        $data['month']=date('F');
        $data['year']=date('Y');
        $order_id=DB::table('orders')->insertGetId($data);   //--insert + get last Inserted order's id--

        // $contents=DB::table('pos')->get();

        // $odata=array();
        // foreach ($contents as $content) {
        //     $odata['order_id']=$order_id;
        //     $odata['product_id']=$content->pro_id;
        //     $odata['pro_quantity']=$content->pro_quantity;
        //     $odata['product_price']=$content->product_price;
        //     $odata['sub_total']=$content->sub_total;
        //     DB::table('order_details')->insert($odata);

        //     DB::table('products')
        //         ->where('id',$content->pro_id)
        //         ->update(['product_quantity' => DB::raw('product_quantity -' .$content->pro_quantity)]);

        // }

        // DB::table('pos')->delete();
        return response('done');
    }

//-------------------------------------------------------------------

    public function index(){
        $product=DB::table('orders')
                ->latest()
                ->first();
        return response()->json($product);
    }


}
