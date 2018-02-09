<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Answer extends Model
{
    protected $fillable = ['question_id','user_id','solution'];

    protected $appends = array('overallvote');

    protected $with = ['user','votes'];

    public function user(){
        return $this->belongsTo('App\User');
    }
    public function votes()
    {
        return $this->hasMany('App\AnswerVotes');
    }
    public function getOverAllVoteAttribute(){
        $score = 0;
        foreach ($this->votes as $vote)
            if($vote['bit'] == 1)
                $score++;
            else
                $score--;
        return $score;
    }
}
