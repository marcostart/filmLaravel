@extends ('template')
@section('titre')
    Une page contact
@endsection

@section('contenu')
<div class="container">
    <div class="row text-white bg-dark">
        <p>Merci pour votre message. Vous recevrez un retour très rapidement. Chers Monsieur :</p>
        {{ $contact['nom'] }} <span> et Votre mail : </span>
        {{ $contact['email'] }}
    </div>
</div>
@endsection
