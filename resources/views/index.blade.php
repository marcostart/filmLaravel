@extends ('template')
@section('titre')
    Une page contact
@endsection

@section('contenu')
<div class="container">
    <div class="row text-white bg-dark">
        <form class=""  method="POST">
            @csrf
            <div class="mb-3">
                <label for="nom">Votre nom svp</label>
                <input type="text" name="nom" id="nom" placeholder="Ex: Marco" class="form-control @error('nom') is-invalid @enderror" value="{{ old('nom') }}">
            </div>
            @error('nom')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror
            <div class="mb-3">
                <label for="email">Votre mail svp</label>
                <input type="text" name="email" id="email" placeholder="Ex: mm@gmail.com" class="form-control @error('email') is-invalid @enderror" value="{{ old('email') }}">
            </div>
            @error('email')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror
            <div class="mb-3">
                <label for="message">Votre message :</label>
                <textarea name="message" id="message" class="form-control @error('message') is-invalid @enderror" >{{ old('message') }}</textarea>
            </div>
            @error('message')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror
            <button class="btn btn-secondary" type="submit" >Envoyer !</button>
        </form>
    </div>
</div>

@endsection
