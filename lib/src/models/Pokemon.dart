class Poke {
  String? name;
  String? image;

  Poke(Map<String, dynamic> json) {
    name = json["forms"][0]["name"];
    image = json["sprites"]["front_default"];
  }

  factory Poke.fromJson(Map<String, dynamic> json) {
    return Poke(json);
  }
}
