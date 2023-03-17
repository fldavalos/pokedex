import 'package:http/http.dart';
import 'package:pokedex/data/dtos/pokemon_dto.dart';
import 'package:pokedex/data/dtos/pokemon_info_dto.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

abstract class PokemonApi {
  Future<List<Pokemon>> getPokemons();
}

class PokemonApiImpl implements PokemonApi {
  final _client = Client();

  @override
  Future<List<Pokemon>> getPokemons() async {
    try {
      final response = await _client.get(
        Uri(
          scheme: "https",
          host: "pokeapi.co",
          path: "/api/v2/pokemon",
          query: "limit=20&offset=0",
        ),
      );
      final pokemonsDto = PokemonsDto.fromJson(response.body);

      final pokemonsFetch = pokemonsDto.results.map((e) async {
        final fetch = _client.get(Uri.parse(e.url));
        return fetch;
      });
      final pokemonsFetched = await Future.wait(pokemonsFetch);

      final pokemonsInfo = pokemonsFetched.map((e) {
        final pokemon = PokemonInfoDto.fromRawJson(e.body);
        return Pokemon(name: pokemon.name, url: pokemon.sprites.other.dreamWorld.frontDefault);
      }).toList();

      return pokemonsInfo;
    } catch (e) {
      throw "";
    }
  }
}
