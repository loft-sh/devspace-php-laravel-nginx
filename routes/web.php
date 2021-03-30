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

Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::get('ping', function () {
    return "pong";
});

Route::get('info', function () {
    return phpinfo();
});

Auth::routes();

Route::get('/test', [App\Http\Controllers\TestController::class, 'index'])->name('test');


