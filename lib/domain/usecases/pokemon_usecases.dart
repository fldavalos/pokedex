import 'package:pokedex/data/repository/repository_impl.dart';

import '../entities/pokemon.dart';

class PokemonUsecases {
  final repositoryImpl = PokemonRepositoryImpl();

  Future<List<Pokemon>> getPokemons() async {
    final pokemonList = await repositoryImpl.getPokemons();
    return pokemonList;
  }
}
