<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class ProductController extends Controller
{
    public function index()
    {
        $product=DB::table('products')
            ->orderBy('products.id','DESC')
            ->get();
        return response()->json($product);
    }
}
