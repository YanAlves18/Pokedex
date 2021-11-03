import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/blocs/GetPokemons/GetPokemonsBloc.dart';
import 'package:pokedex/src/models/Pokemon.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Pokedex",
          style:
              TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w400),
        ),
        backgroundColor: Color(0xffCB1D0E),
      ),
      body: BlocBuilder<GetPokemonsBloc, GetPokemonsState>(
        builder: (context, state) {
          if (state is LoadingGetPokemonsState) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xffCB1D0E)),
              ),
            );
          } else if (state is ErrorGetPokemonsState) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(state.message,
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16)),
              ),
            );
          } else if (state is SuccessGetPokemonsState) {
            return ListView.builder(
                itemCount: state.pokemons.length,
                itemBuilder: (context, index) {
                  return itemList(state.pokemons[index]);
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget itemList(Poke pokemon) {
    return Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3))
          ],
        ),
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 3),
                child: CachedNetworkImage(
                  imageUrl: pokemon.image!,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xffCB1D0E)),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/image.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Text(pokemon.name!.toUpperCase(),
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
              ),
            ],
          ),
        ));
  }
}
