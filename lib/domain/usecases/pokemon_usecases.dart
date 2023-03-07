import 'package:pokedex/data/repository/repository.dart';

import '../entities/pokemon.dart';

class PokemonUsecases {
  final repository = PokemonRepository();
  List<Pokemon> pokemonList = [];

  Future<List<Pokemon>> getPokemons() async {
    pokemonList = await repository.getPokemons();
    return pokemonList;
  }
}
