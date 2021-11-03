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
        
        for (int i = 1; i < 50; i++) {
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
