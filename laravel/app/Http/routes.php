<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', 'WelcomeController@index');

Route::get('home', 'HomeController@index');

Route::get('user/{id}/{name?}', function($id, $name = 'sean') 
	{
		return 'hello world-'.'User-id-'.$id.'-name-'.$name;
	} 
)->where(['id' => '[0-9]+', 'name' => '[a-zA-Z]+']);

Route::match(['get', 'post'], 'muty1', function(){return "muty1"});

Route::any('muty2', function(){return "muty2"});

Route::controllers([
	'auth' => 'Auth\AuthController',
	'password' => 'Auth\PasswordController',
]);
