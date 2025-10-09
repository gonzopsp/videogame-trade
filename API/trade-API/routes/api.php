<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\VideogameController;

Route::get('/videogames', [VideogameController::class, 'index']);
