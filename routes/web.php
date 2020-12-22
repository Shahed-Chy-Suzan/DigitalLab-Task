<?php
use Illuminate\Support\Facades\Route;



Route::get('/', function () {
    return view('welcome');
});

// Route::get('/{vue_capture?}',function () {	//here,"vue_capture" is jst a random_variable
//     return view('welcome'); 	//if we hit with random route,it will go 'welcome' page
// })->where('vue_capture', '[\/\w\.-]*');



Route::get('/product','ProductController@index');               //--Product
Route::get('/addTocart/{id}','CartController@AddToCart');       //--Cart
Route::get('/cart/product','CartController@CartProduct');
Route::get('/remove/cart/{id}','CartController@removeCart');
Route::get('/increment/{id}','CartController@Increment');
Route::get('/decrement/{id}','CartController@Decrement');

Route::post('/orderdone','PosController@OrderDone');      //--Order_Done

Route::get('/invoice','PosController@index');               //--Product
