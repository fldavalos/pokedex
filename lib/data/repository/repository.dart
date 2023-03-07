import '../../domain/entities/pokemon.dart';
import '../datasources/remote/pokemon_repo_impl.dart';

abstract class Repository {
  Future<List<Pokemon>> getPokemons();
}

class PokemonRepository extends Repository {
  final pokemonRepositoryImpl = PokemonRepositoryImpl();

  @override
  Future<List<Pokemon>> getPokemons() async {
    final pokemonList = await pokemonRepositoryImpl.getPokemons();
    return pokemonList;
  }
}
