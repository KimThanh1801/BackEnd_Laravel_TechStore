<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

// Google
Route::get('auth/google/redirect', [AuthController::class, 'redirectToGoogle']); 
Route::get('auth/google/callback', [AuthController::class, 'handleGoogleCallback']); 

Route::get('/', function () {
    return view('welcome');
});
