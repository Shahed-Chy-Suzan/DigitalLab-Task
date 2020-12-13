<?php
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::get('/product','ProductController@index');               //--Product
Route::get('/addTocart/{id}','CartController@AddToCart');       //--Cart
Route::get('/cart/product','CartController@CartProduct');
Route::get('/remove/cart/{id}','CartController@removeCart');
Route::get('/increment/{id}','CartController@Increment');
Route::get('/decrement/{id}','CartController@Decrement');

Route::post('/orderdone','PosController@OrderDone');      //--Order_Done

Route::get('/invoice','PosController@index');               //--Product
