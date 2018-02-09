<?php

namespace App\Http\Controllers;

use App\Answer;
use App\AnswerVotes;
use App\Question;
use App\Tag;
use App\Vote;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;

class QuestionController extends Controller
{
    public function store(Request $request){        
        $request->validate([
            'subject' => 'required|max:256',
            'desc' => 'required|max:1024',
            'category' => 'required|max:50',
            'tags' => 'required|array|min:1',
            'tags.*' => 'required|distinct|min:1'
        ],[
            'subject.required' => 'Subject is required.',
            'desc.required' => 'Description is required.',
            'tags.*.min' => 'All Tags must have 3 or more characters.'
        ]);

        $user = JWTAuth::parsetoken()->toUser();
        $question = Question::create([
            'user_id' => $user['id'],
            'subject' => $request->input('subject'),
            'desc' => $request->input('desc'),
            'category' => $request->input('category'),
        ]);
        $tags =  $request->input('tags');
        foreach ($tags as $tag)
        Tag::create([
            'question_id' => $question['id'],
            'name' => $tag
        ]);
        return response()->json(['message' => 'Created Successfully.']);
    }

    public function get(){
        $questions = Question::paginate(15);
        return response()->json($questions,200);
    }
    public function getinfo($id){
        $question = Question::find($id);
        if($question == null)
            return response()->json([],404);
        return response()->json($question,200);
    }

    public function submitAnswer(Request $request, $id){
        $request->validate([
            'answer' => 'required'
        ]);
        $question = Question::find($id);
        if($question == null)
            return response()->json([],404);
        $user = JWTAuth::parsetoken()->toUser();

        Answer::create([
            'question_id' => $question['id'],
            'user_id' => $user['id'],
            'solution' => $request->input('answer')
        ]);
        return response()->json(['message' => 'Successful.']);
    }

    public function answervote(Request $request, $id){
        $request->validate([
            'answer_id' => 'required',
            'bit' => 'required'
        ]);
        $question = Question::find($id);
        if($question == null)
            return response()->json([],404);

        $answer_id = $request->input('answer_id');
        $bit = $request->input('bit');;
        $user = JWTAuth::parsetoken()->toUser();
        $vote = AnswerVotes::where('answer_id',$answer_id)->where('question_id',$question['id'])->where('user_id',$user['id'])->first();
        //return response()->json($vote);
        if($vote == null)
            AnswerVotes::create([
            'answer_id' => $answer_id,
            'user_id' => $user['id'],
            'question_id' => $question['id'],
            'bit' => $bit
        ]);
        else
        {
            //return response()->json($vote);
            if($vote['bit'] != $bit)
                $vote->update(['bit' => $bit]);
            else {
                $vote->delete();
                return response()->json(['message' => 'Vote Removed Successful.']);
            }
        }
        $voted = $bit == 0 ? 'Voted Down': 'Voted Up';
        return response()->json(['message' => $voted . ' Successful.']);
    }
    public function recent(Request $request){
        $page = $request->input('page');
        $perpage = $request->input('perpage');

        $data = Question::orderBy('created_at','desc')->paginate($perpage, null, null, $page);
        //dd($data);
        return response()->json([
            "questions" => $data->items(),
            "paginationinfo" => [
                "currentPage" => $data->currentPage(),
                "itemsPerPage" => $data->perPage(),
                "totalItems" => $data->total()]
        ]);
    }
    public function update(Request $request, $id){

    }
    public function search(Request $request){
        $request->validate([
            'tagnames' => 'required|array'
        ]);
        $tagnames = $request->input('tagnames');

        //$page = $request->input('page');
       // $perpage = $request->input('perpage');
       //return response()->json($tagnames);
        $data = Tag::whereIn('name', $tagnames)->get();
        return response()->json($data);
        //dd($data);
        return response()->json([
            "questions" => $data->items(),
            "paginationinfo" => [
                "currentPage" => $data->currentPage(),
                "itemsPerPage" => $data->perPage(),
                "totalItems" => $data->total()]
        ]);
    }
    public function delete($id){

    }
}
