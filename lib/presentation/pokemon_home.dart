import 'package:flutter/material.dart';
import 'package:pokedex/domain/usecases/pokemon_usecases.dart';

class PokemonHome extends StatelessWidget {
  const PokemonHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usecases = PokemonUsecases();
    return Scaffold(
      body: FutureBuilder(
        initialData: const [],
        future: usecases.getPokemons(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: usecases.pokemonList.length,
              itemBuilder: (context, index) {
                final pokemon = usecases.pokemonList[index];
                return ListTile(
                  title: Text(pokemon.name),
                  subtitle: Text(pokemon.url),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
