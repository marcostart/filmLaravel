@extends('template')
@section('titre')
    Des films
@endsection

@section('contenu')
    @if (session()->has('info'))
        <div class="info">
            <script type="text/javascript">
                alert("{{ session('info')}}")
            </script>

        </div>
    @endif
    <header>
        <div class="category">
            <select class="" name="" onChange="window.location.href=this.value">
                <option value="{{ route('film.index') }}" @unless($slug) 'selected' @endunless>Toutes les catégories</option>
                @foreach($categories as $category)
                    <option value="{{ route('film.category', $category->slug) }}" {{ $slug == $category->slug ? 'selected' : '' }}> <a href="{{ route('film.category', $category->slug) }}"> {{ $category->nameCategory }} </a> </option>
                @endforeach
            </select>
        </div>
        <div class="ajout">
            <a href="{{route('film.create')}}"> <button type="button" class="btn btn-info" name="button">Ajouter un film</button> </a>
        </div>
    </header>
    <div class="tous">
        <table>
            <caption>Liste des films</caption>
            <tr>
                <th>Titre</th>
                <th colspan="3">Options</th>
            </tr>
            @foreach ($films as $film)
                <tr @if ($film->deleted_at) style="background-color: gray;" @endif>
                    <td> <strong>{{$film->titre}}</strong> </td>
                    <td>
                        @if($film->deleted_at)
                            <form class="" action="{{ route('film.restore', $film->id)}}" method="post">
                                @csrf
                                @method('PUT')
                                <button type="submit" class="btn btn-primary" name="button">Restaurer</button>
                            </form>
                        @else
                            <a href="{{route('film.show',$film->id)}}"> <button type="button" class="btn btn-primary" name="button">Voir</button> </a> </td>
                        @endif
                    <td>
                        @if($film->deleted_at)
                        @else
                        <a href="{{route('film.edit',$film->id)}}"> <button type="button" class="btn btn-warning" name="button">Modifier</button> </a> </td>
                        @endif
                    <td>
                        <form class="" action="{{route(($film->deleted_at) ? 'film.force.destroy' : 'film.destroy' , $film->id) }}" method="post">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger" name="button">Supprimer</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </table>
        <footer>
                {{ $films->links()}}
        </footer>
    </div>

@endsection
@section('css')
    <style media="screen">
        tr{
            border-collapse: collapse;
        }
        td, th{
            border: solid 2px blue;
            padding: 5px;
            text-align: center;
        }
        .tous{
            width: 60%;
            margin: auto;
            margin-top: 5%;

        }
        header{
            text-align: right;

        }
        .category, .ajout{
            width: 10%;
            display: inline-block;
            margin: 25px;
        }
        a{
            text-decoration: underline;
        }
    </style>
@endsection
