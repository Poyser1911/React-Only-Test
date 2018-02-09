<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    protected $fillable = ['question_id','name'];
    protected $appends = array('question');

    public function getQuestionAttribute()
    {
        $question = \App\Question::where('id', $this['question_id'])->get(['subject','desc','category','user_id']);
        return  $question;
    }
}
