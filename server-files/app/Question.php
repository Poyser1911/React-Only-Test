<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    protected $fillable = ['user_id','subject','desc','category'];

    protected $with = ['tags','user','answers'];
    public function tags()
    {
        return $this->hasMany('App\Tag');
    }
    public function user(){
        return $this->belongsTo('App\User');
    }
    public function answers()
    {
        return $this->hasMany('App\Answer');
    }
}
