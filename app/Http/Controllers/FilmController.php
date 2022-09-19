<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\{ Film, Category };
use App\Http\Requests\FilmRequest;

class FilmController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($slug=null)
    {
        $query = $slug ? Category::whereSlug($slug)->firstOrFail()->films() : Film::query();
        $films= $query->withTrashed()->oldest('titre')->paginate(5);
        return view('filmIndex',compact('films','slug'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('createFilm') ;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(FilmRequest $request)
    {
        Film::create($request->all());

        return redirect()->route('film.index')->with('info','Le film a été enregistré avec succès dans la base.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Film $film)
    {
        $category= $film->category->nameCategory;
        return view('filmShow',compact('film','category'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Film $film)
    {
        return view('filmEdit',compact('film'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(FilmRequest $request, Film $film)
    {
        $film->update($request->all());

        return redirect()->route('film.index')->with('info','Le film a bien été modifié.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Film $film)
    {
        $film->delete();

        return back()->with('info','Le film a bien été placé dans la corbeille .');
    }
    public function forceDestroy($id)
    {
        Film::withTrashed()->whereId($id)->firstOrFail()->forceDelete();

        return back()->with('info','Le film a bien été supprimé de la base.');
    }
    public function restore($id)
    {
        Film::withTrashed()->whereId($id)->firstOrFail()->restore();

        return back()->with('info','Le film a bien été restoré.');
    }
}
