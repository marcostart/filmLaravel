@extends('template')

@section('titre')
    Les factures
@endsection

@section('contenu')
<div class="container">
    <div class="row text-white bg-dark">
        <form class=""  method="POST" enctype="multipart/form-data">
            @csrf
            <div class="mb-3">
                <label for="image">Votre Image svp</label>
                <input type="file" name="image" id="image" class="form-control @error('image') is-invalid @enderror">
            </div>
            @error('image')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror

            <div class="mb-3">
                <label for="fichier">Votre Fichier svp</label>
                <input type="file" name="fichier" id="fichier" class="form-control @error('fichier') is-invalid @enderror">
            </div>
            @error('fichier')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror
            <button class="btn btn-secondary" type="submit" >Envoyer !</button>
        </form>
    </div>
</div>
@endsection
