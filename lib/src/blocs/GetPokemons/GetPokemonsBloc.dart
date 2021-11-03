import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/src/models/Pokemon.dart';
import 'package:pokedex/src/providers/Api+Pokemons.dart';

part 'GetPokemonsEvent.dart';
part 'GetPokemonsState.dart';

class GetPokemonsBloc extends Bloc<GetPokemonsEvent, GetPokemonsState> {
  List<Poke> pokemons;
  GetPokemonsBloc()
      : pokemons = [],
        super(GetPokemonsInitial());
  @override
  Stream<GetPokemonsState> mapEventToState(
    GetPokemonsEvent event,
  ) async* {
    try {
      if (event is GetPokemonsEvent) {
        yield LoadingGetPokemonsState();

        // var response = await ApiPokemons.pokemonList();

        // if (response != null) {
        //   for (var p in response) {
        //     Poke pokemon = Poke.fromJson(p);
        //     pokemons.add(pokemon);
        //   }

        //   yield SuccessGetPokemonsState(pokemons);
        //   pokemons = [];
        // } else {
        //   yield ErrorGetPokemonsState(
        //       "Não foi possível listar os pokémons, tente novamente mais tarde!");
        // }
        for (int i = 1; i < 100; i++) {
          var response = await ApiPokemons.getPokemon(i);
          Poke pokemon = Poke.fromJson(response);
          pokemons.add(pokemon);
        }
        yield SuccessGetPokemonsState(pokemons);
        pokemons = [];
      }
    } catch (e) {
      yield ErrorGetPokemonsState(
          "Não foi possível listar os pokémons, tente novamente mais tarde!");
    }
  }
}
