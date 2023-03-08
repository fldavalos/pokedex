import 'package:pokedex/data/datasources/remote/pokemon_api.dart';
import 'package:pokedex/data/repository/repository.dart';

import '../../domain/entities/pokemon.dart';

class PokemonRepositoryImpl extends Repository {
  final pokemonApiImpl = PokemonApiImpl();

  @override
  Future<List<Pokemon>> getPokemons() async {
    final pokemonList = await pokemonApiImpl.getPokemons();
    return pokemonList;
  }
}
