import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

import '../../domain/usecases/pokemon_usecases.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final pokemonUsecases = PokemonUsecases();

  PokemonsBloc() : super(PokemonsInitial()) {
    on<GetPokemonsListEvent>((event, emit) async {
      PokemonsLoadingState();
      try {
        final pokemonList = await pokemonUsecases.getPokemons();
        emit(PokemonsLoadedState(pokemons: pokemonList));
      } catch (e) {
        emit(PokemonsErrorState(message: "Error en la Api"));
      }
    });
  }
}
