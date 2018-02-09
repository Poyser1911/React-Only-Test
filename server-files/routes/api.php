<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/question','QuestionController@store')
->middleware('auth.jwt');

Route::post('/questions','QuestionController@get');

Route::post('/question/{id}','QuestionController@getinfo');

Route::post('/questions/q','QuestionController@search');

Route::post('/question/{id}/answer','QuestionController@submitAnswer')->middleware('auth.jwt');

Route::post('/question/{id}/answer/answervote','QuestionController@answervote')->middleware('auth.jwt');

Route::post('/questions/recent','QuestionController@recent');

Route::put('/question/{id}','QuestionController@update');

Route::delete('/question/{id}','QuestionController@delete');


Route::post('/user','UserController@signup');

Route::post('/user/signin','UserController@signin');

Route::put('/user/{id}','UserController@update');

Route::delete('/user/{id}','UserController@delete');

Route::post('/user/getinfo','UserController@getuserinfo');