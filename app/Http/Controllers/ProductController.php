<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
// use AuthorizesRequests;
// use DispatchesJobs;
// use ValidatesRequests;
// use App\Product;

class ProductController extends Controller
{

    // public function __construct()
    // {
    //     ini_set('max_execution_time', 300);
    // }

    public function index()
    {
        $product=DB::table('products')
            ->join('tbl_prod_category','products.ref_category_id','tbl_prod_category.id_category')
            ->select('products.*','tbl_prod_category.*')
            ->orderBy('products.id','DESC')
            ->get();
        return response()->json($product);
    }

    // public function loop(){
    //     $data= array();
    //     for ($i=0; $i <100000 ; $i++) {
    //         $data['ref_category_id']= "1";
    //         $data['product_name']= "name";
    //         $data['product_price']= "price";
    //         $data['product_quantity']= "1";

    //         DB::table('products')->insert($data);
    //     }
    //     return response('done');
    // }

    // public function loop(){
        // for ($i=0; $i < 100000; $i++) {
        //     $userData[] = [
        //         'ref_category_id' => '1',
        //         'product_name' => 'name',
        //         'product_price' => 'price',
        //         'product_quantity' => '1',
        //     ];
        // }

            //-----------------------------------------------
        // foreach ($userData as $user) {
        //     Product::insert($user);
        // }
        // $data_to_insert = [];

            //-----------------------------------------------
        // $data_to_insert = [];
        // foreach ($response as $key => $value)
        // {
        //     array_push($data_to_insert, [
        //             'test1' => $value['test1'],
        //             'test2' => $value['test2'],
        //             'test3' => $value['test3'],
        //             'test4' => $value['test4'],
        //             'test5' => $value['test5'],
        //     ]);
        // }
    // }

}
