<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\VideogameController;


//videogames
Route::get('/videogames', [VideogameController::class, 'index']);


//genre
Route::get('/genres', [GenreController::class, 'index']);
