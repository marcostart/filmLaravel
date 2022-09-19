<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> @yield('titre')</title>
        <link rel="stylesheet" href="{{ URL::asset('css/bootstrap.min.css'); }}" >
        @yield('css')
    </head>
    <body>
        @yield('contenu')
    </body>
</html>
