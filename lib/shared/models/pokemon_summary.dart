import 'package:pokedex/shared/models/pokemon.dart';

class PokemonSummary {
  late String number;
  late String name;
  late String imageUrl;
  late String thumbnailUrl;
  late Sprites sprites;
  late List<String> types;
  late String specie;
  late Generation generation;

  PokemonSummary(
      {required this.number,
      required this.name,
      required this.imageUrl,
        required this.thumbnailUrl,
      required this.sprites,
      required this.types,
      required this.specie,
      required this.generation});

  PokemonSummary.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    thumbnailUrl = json['thumbnailUrl'];
    sprites = Sprites.fromJson(json['sprites']);
    types = json['types'].cast<String>();
    specie = json['specie'];
    generation = Generation.values
        .where((it) => it.toString().endsWith(json['generation']))
        .first;
  }
}
