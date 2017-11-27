<?php

namespace App;
use Illuminate\Database\Eloquent\Model;

class Board extends Model {

       protected $guarded= [];

    public function user()
    {
        return $this->belongsTo(User::class);

       }

    public function lists()
    {
        return $this->hasMany(Lists::class);
    }


}