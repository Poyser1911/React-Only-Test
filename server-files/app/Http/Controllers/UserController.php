<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Facades\JWTAuth;

class UserController extends Controller
{
    public function signup(Request $request){
        $this->validate($request,[
            'username' => 'required|alpha_dash|unique:users',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6'
        ]);

        $user = new User([
            'username' => $request->input('username'),
            'email' => $request->input('email'),
            'password' => bcrypt($request->input('password')),
        ]);
        $user->save();

        return response()->json([
            'message' => 'User Created Successfully'
        ],201);
    }

    public function signin(Request $request){
        $this->validate($request,[
            'identity' => 'required',
            'password' => 'required|min:6'
        ]);
        $u = $request->only('identity','password');
       if (filter_var($u['identity'], FILTER_VALIDATE_EMAIL)) {
           $creds = ['email' => $u['identity'],'password' => $u['password']];
       }
       else{
           $creds = ['username' => $u['identity'],'password' => $u['password']];
       }
       // dd($creds);

        try{
            if(!$token = JWTAuth::attempt($creds)){
                return response()->json([
                    'error' => 'Invalid Login'
                ],401);
            }
        }catch (JWTException $e){
            return response()->json([
                'error' => 'Could not create token'
            ],500);
        }
        return response()->json([
            'token' => $token
        ],200);
    }

    public function getuserinfo(){
        $user = JWTAuth::parsetoken()->toUser();
        return response()->json($user);
    }
    public function update(Request $request, $id){

    }
    public function delete($id){

    }
}
