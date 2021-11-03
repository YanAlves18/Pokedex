import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiPokemons {
  static Future<dynamic> getPokemon(int id) async {
    Uri url = Uri.https(
      "pokeapi.co",
      "/api/v2/pokemon/$id",
    );

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      return null;
    }
  }
}
