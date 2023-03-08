import "package:flutter/material.dart";

import '../../domain/entities/pokemon.dart';

class PokemonList extends StatelessWidget {
  final List<Pokemon> pokemonsList;
  const PokemonList({Key? key, required this.pokemonsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemCount: pokemonsList.length,
        itemBuilder: (context, index) {
          final pokemon = pokemonsList[index];
          return ListTile(
            title: Text(pokemon.name),
            subtitle: Text(pokemon.url),
          );
        },
      ),
    );
  }
}
