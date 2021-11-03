part of 'GetPokemonsBloc.dart';

abstract class GetPokemonsState extends Equatable {
  const GetPokemonsState();

  @override
  List<Object> get props => [];
}

class GetPokemonsInitial extends GetPokemonsState { }

class SuccessGetPokemonsState extends GetPokemonsState {
  final List<Poke> pokemons;

  SuccessGetPokemonsState(this.pokemons);

  @override
  List<Object> get props => [this.pokemons];
}

class LoadingGetPokemonsState extends GetPokemonsState { }

class ErrorGetPokemonsState extends GetPokemonsState {
  final String message;

  ErrorGetPokemonsState(this.message);

  @override
  List<Object> get props => [this.message];
}
