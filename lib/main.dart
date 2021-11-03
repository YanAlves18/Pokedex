import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/blocs/GetPokemons/GetPokemonsBloc.dart';
import 'src/views/Splash.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<GetPokemonsBloc>(
        create: (BuildContext context) => GetPokemonsBloc(),
      ),
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
