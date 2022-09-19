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

//Pour les "films"
use App\Http\Controllers\FilmController;

Route::resource('film', FilmController::class);

Route::controller(FilmController::class)->group(function () {
    Route::delete('film/force/{film}', 'forceDestroy')->name('film.force.destroy');
    Route::put('film/restore/{film}', 'restore')->name('film.restore');
    //Par categorie
    Route::get('category/{slug}/film', 'index')->name('film.category');
});


//Pour le formulaire contact
use App\Http\Controllers\UserController;
Route::post('contact', [UserController::class, 'store'])->name('contact.store');
Route::get('contact', [UserController::class, 'create'])->name('contact.create');
Route::get('/contact-test', function () {
    return new App\Mail\Contact([
        'nom'=>'marco',
        'email'=>'kkk@lll.com',
        'message'=>'Très bien pour un début'
    ]);
});
//Pour l'upload
use App\Http\Controllers\ImageController;
Route::get('image', [ImageController::class, 'create']);
Route::post('image', [ImageController::class, 'store']);

Route::get('/', function () {
    return view('welcome');
});

Route::get('{n}', function ($n) {
    return 'Bienvenue sur une page '.$n.' quelconque !';
});

use App\Http\Controllers\ArticleController;

Route::get('article/{n}', [ArticleController::class, 'show'])->where('n','[0-9]+');

Route::get('facture/{n}', function ($n) {
    return view('facture')->with('numero',$n);
})->where('n','[0-9]+');
Route::get('bootstrap', function () {
    return view('bootstrap');
});
