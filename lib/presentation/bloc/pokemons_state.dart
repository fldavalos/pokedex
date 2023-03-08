part of 'pokemons_bloc.dart';

@immutable
abstract class PokemonsState {}

class PokemonsInitial extends PokemonsState {}

class PokemonsLoadingState extends PokemonsState {}

class PokemonsLoadedState extends PokemonsState {
  final List<Pokemon> pokemons;

  PokemonsLoadedState({required this.pokemons});
}

class PokemonsErrorState extends PokemonsState {
  final String message;

  PokemonsErrorState({required this.message});
}
