import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/presentation/bloc/pokemons_bloc.dart';
import 'package:pokedex/presentation/widgets/error_message.dart';

class PokedexHome extends StatelessWidget {
  const PokedexHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pokemonsList = <Pokemon>[];
    BlocProvider.of<PokemonsBloc>(context).add(GetPokemonsListEvent());

    return Scaffold(
        appBar: AppBar(title: const Text("Pokedex")),
        body: BlocBuilder<PokemonsBloc, PokemonsState>(
          builder: (context, state) {
            if (state is PokemonsInitial) {
              pokemonsList = [];
            } else if (state is PokemonsLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is PokemonsLoadedState) {
              pokemonsList.addAll(state.pokemons);
              return ListView.separated(
                separatorBuilder: (context, index) => Container(
                  height: 10.0,
                  color: Colors.grey,
                ),
                itemCount: pokemonsList.length,
                itemBuilder: ((context, index) {
                  return Container(
                    color: Colors.grey,
                    child: Card(
                      color: Colors.amber,
                      margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: GestureDetector(
                        // onTap: () => ,
                        child: Container(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              SvgPicture.network(
                                pokemonsList[index].url,
                                height: 150.0,
                                fit: BoxFit.contain,
                                placeholderBuilder: (BuildContext context) => Container(
                                  padding: const EdgeInsets.all(30.0),
                                  child: const CircularProgressIndicator(),
                                  color: Colors.amber,
                                ),
                              ),
                              Text(
                                pokemonsList[index].name,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              );
            } else if (state is PokemonsErrorState) {
              return ErrorMessage(
                message: state.message,
              );
            }
            return Container(
              color: Colors.black26,
            );
          },
        ));
  }
}
