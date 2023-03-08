import '../../domain/entities/pokemon.dart';

abstract class Repository {
  Future<List<Pokemon>> getPokemons();
}
