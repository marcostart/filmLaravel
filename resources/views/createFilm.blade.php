@extends ('template')
@section('titre')
    Creation d'un film
@endsection

@section('contenu')
<div class="container">
    <div class="row text-white bg-dark">
        <form class=""  method="POST" action="{{ route('film.store')}}">
            @csrf
            <div class="mb-3">
                <label for="category_id">La categorie du film :</label><br>
                <select id="category_id" name="category_id">
                    @foreach ($categories as $category)
                        <option value=" {{$category->id}}">{{$category->nameCategory}}</option>
                    @endforeach
                </select>
            </div>
            <div class="mb-3">
                <label for="titre">Le titre du film :</label><br>
                <input type="text" name="titre" id="titre" placeholder="Le titre du film" class="form-control @error('titre') is-invalid @enderror" value="{{ old('titre') }}">
            </div>
            @error('titre')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror
            <div class="mb-3">
                <label for="annee">Quelle est son année de création ?</label><br>
                <input type="number" name="annee" id="annee" placeholder="Année de création" min="1950" max="{{ date('Y')}}" class="form-control @error('annee') is-invalid @enderror" value="{{ old('annee') }}">
            </div>
            @error('titre')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror
            <div class="mb-3">
                <label for="description">Votre message :</label>
                <textarea name="description" id="description" class="form-control @error('description') is-invalid @enderror" >{{ old('description') }}</textarea>
            </div>
            @error('description')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror
            <button class="btn btn-secondary" type="submit" >Envoyer !</button>
        </form>
    </div>
</div>

@endsection
