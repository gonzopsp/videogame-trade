<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Videogame;

class VideogameController extends Controller
{
    public function index(){
        $videogames =  Videogame::with('images','genre')->get();

        $videogames->transform(function ($game) {
            $game->images->transform(function ($image) {
                $image->image_path = url($image->image_path); // prepend base URL
                return $image;
            });
            return $game;
        });

        return response()->json($videogames);
    }
}
