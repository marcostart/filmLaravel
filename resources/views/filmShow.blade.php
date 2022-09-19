@extends('template')

@section('titre')
    Le film {{ $film->titre}}
@endsection
@section('contenu')
    <header>
        <h1>Titre du film : {{$film->titre}}</h1>
    </header>
    <section>
        <div class="an">
            <p>Catégorie : {{ $category }}</p>
        </div>
        <div class="an">
            <p>Annee de sortie : {{ $film->annee}}</p>
        </div>
        <div class="desc">
            <p>{{ $film->description}}</p>
        </div>
    </section>
    <div class="retour">
        <a href="{{ route('film.index')}}"> <button type="button" class="btn btn-secondary" name="button">Retour</button> </a>
    </div>
@endsection
@section('css')
    <style media="screen">
        h1{
            text-align: center;
            margin: 5%;
        }
        .retour{
            text-align: center;
        }
        .an, .desc{
            margin: 5%;
        }
    </style>
@endsection
