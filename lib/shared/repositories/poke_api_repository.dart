import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/shared/models/pokemon_summary.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/utils/api_constants.dart';

class PokeApiRepository {
  Future<List<PokemonSummary>> fetchPokemonsSummary() async {
    try {
      final response =
          await http.get(Uri.parse(ApiConstants.pokedexSummaryData));

      return List<PokemonSummary>.from(
        json.decode(response.body).map(
              (model) => PokemonSummary.fromJson(model),
            ),
      );
    } catch (e) {
      throw e;
    }
  }

  Future<Pokemon> fetchPokemon(String number) async {
    try {
      final response =
          await http.get(Uri.parse(ApiConstants.pokemonDetails(number)));

      return Pokemon.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
