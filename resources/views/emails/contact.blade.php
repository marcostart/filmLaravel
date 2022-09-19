<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Un mail</title>
    </head>
    <body>
        <h2>Prise de contact avec laravel</h2>
        <p>Réception d'un mail avec les informtions suivantes :</p>
        <ul>
            <li> <strong>Nom</strong> : {{ $contact['nom'] }} </li>
            <li> <strong>Email</strong> : {{ $contact['email'] }} </li>
            <li> <strong>Message</strong> : {{ $contact['message'] }} </li>
        </ul>
    </body>
</html>
