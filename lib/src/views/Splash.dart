import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/blocs/GetPokemons/GetPokemonsBloc.dart';

import 'Home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late GetPokemonsBloc _pokemonsBloc;
  @override
  void initState() {
    super.initState();

    _pokemonsBloc = BlocProvider.of<GetPokemonsBloc>(context);
    _pokemonsBloc.add(GetPokemons());

    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: Image(
                image: AssetImage('assets/images/image.png'),
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
