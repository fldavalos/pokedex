import 'package:pokedex/data/repository/repository_impl.dart';

import '../entities/pokemon.dart';

class PokemonUsecases {
  final repository = PokemonRepositoryImpl();
  List<Pokemon> pokemonList = [];

  Future<List<Pokemon>> getPokemons() async {
    pokemonList = await repository.getPokemons();
    return pokemonList;
  }
}
