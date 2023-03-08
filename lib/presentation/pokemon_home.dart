import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presentation/bloc/pokemons_bloc.dart';

import 'package:pokedex/presentation/widgets/custom_button.dart';
import 'package:pokedex/presentation/widgets/error_message.dart';
import 'package:pokedex/presentation/widgets/pokemon_list.dart';

class PokemonHome extends StatelessWidget {
  const PokemonHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokemon")),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<PokemonsBloc, PokemonsState>(
                  builder: (context, state) {
                    if (state is PokemonsInitial) {
                      return const Text("Please press the button");
                    } else if (state is PokemonsLoadingState) {
                      return const CircularProgressIndicator();
                    } else if (state is PokemonsLoadedState) {
                      return PokemonList(pokemonsList: state.pokemons);
                    } else if (state is PokemonsErrorState) {
                      return ErrorMessage(
                        message: state.message,
                      );
                    }
                    return Container(
                      color: Colors.black26,
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(
                    onTap: () => BlocProvider.of<PokemonsBloc>(context)
                        .add(GetPokemonsListEvent())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
