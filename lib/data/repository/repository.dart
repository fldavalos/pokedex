import '../../domain/entities/pokemon.dart';
import '../datasources/remote/pokemon_api.dart';

abstract class Repository {
  Future<List<Pokemon>> getPokemons();
}
