<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Http\Requests\ContactRequest;
use App\Mail\Contact;

class UserController extends Controller
{
    public function create(){
        return view('index');
    }
    public function store(ContactRequest $request){
        Mail::to('marcolinmontcho@gmail.com')->send(new Contact($request->except('_token')));

        \App\Models\Contact::create([
            'nom'=>$request->nom,
            'email'=>$request->email,
            'message'=>$request->message
        ]);

        return view('confirm')->with('contact',$request);
    }
}
