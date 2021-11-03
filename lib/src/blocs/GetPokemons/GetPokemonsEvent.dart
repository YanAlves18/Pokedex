part of 'GetPokemonsBloc.dart';

abstract class GetPokemonsEvent extends Equatable {
  const GetPokemonsEvent();

  @override
  List<Object> get props => [];
}

class GetPokemons extends GetPokemonsEvent { }

