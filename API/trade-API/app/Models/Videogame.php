<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Videogame extends Model
{
    //relationships
    public function images(){
        return $this->hasMany(VideogameImage::class);
    }
    public function genre(){
        return $this->belongsTo(Genre::class);
    }

    public function offer(){
        return $this->HasOne(Oferta::class);
    }

}
