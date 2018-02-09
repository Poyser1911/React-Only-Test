<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AnswerVotes extends Model
{
    protected $fillable = ['answer_id','user_id','question_id','bit'];
}
