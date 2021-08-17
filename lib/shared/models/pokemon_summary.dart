import 'package:pokedex/shared/models/pokemon.dart';

class PokemonSummary {
  late String number;
  late String name;
  late String image;
  late Sprites sprites;
  late List<String> types;
  late String specie;
  late String generation;

  PokemonSummary(
      {required this.number,
      required this.name,
      required this.image,
      required this.sprites,
      required this.types,
      required this.specie,
      required this.generation});

  PokemonSummary.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    image = json['image'];
    sprites = Sprites.fromJson(json['sprites']);
    types = json['types'].cast<String>();
    specie = json['specie'];
    generation = json['generation'];
  }
}
