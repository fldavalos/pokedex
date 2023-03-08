import 'package:http/http.dart';
import 'package:pokedex/data/dtos/pokemon_dto.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

abstract class PokemonApi {
  Future<List<Pokemon>> getPokemons();
}

class PokemonApiImpl implements PokemonApi {
  final _client = Client();

  @override
  Future<List<Pokemon>> getPokemons() async {
    try {
      final response = await _client.get(Uri(
          scheme: "https",
          host: "pokeapi.co",
          path: "/api/v2/pokemon",
          query: "limit=2000&offset=0"));
      final pokemonsDto = PokemonsDto.fromJson(response.body);

      return pokemonsDto.results
          .map((pokemonDto) =>
              Pokemon(name: pokemonDto.name, url: pokemonDto.url))
          .toList();
    } catch (e) {
      throw "";
    }
  }
}
