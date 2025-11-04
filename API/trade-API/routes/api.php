<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\VideogameController;
use App\Http\Controllers\Api\GenreController;
use App\Http\Controllers\Api\OfferController;

//videogames
Route::get('/videogames', [VideogameController::class, 'index']);


//genre
Route::get('/genres', [GenreController::class, 'index']);

//
//offers
Route::get('/offers',[OfferController::class,'index']);