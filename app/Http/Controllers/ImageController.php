<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\ImageRequest;
use App\Repositories\PhotoRepositoryInterface;

class ImageController extends Controller
{
    public function create(){
        return view('photo');
    }
    public function store(ImageRequest $request, PhotoRepositoryInterface $repository){
        $repository->save($request->image);
        $repository->save($request->fichier);

        return view('photo_yes');
    }
}
