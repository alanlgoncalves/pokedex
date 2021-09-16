import 'dart:convert';

import 'package:pokedex/shared/models/item.dart';
import 'package:pokedex/shared/utils/api_constants.dart';
import 'package:http/http.dart' as http;

class ItemRepository {
  Future<List<Item>> fetchItems() async {
    try {
      final response = await http.get(Uri.parse(ApiConstants.pokemonItems));

      return List<Item>.from(
        json.decode(Utf8Decoder().convert(response.body.codeUnits)).map(
              (model) => Item.fromMap(model),
            ),
      );
    } catch (e) {
      throw e;
    }
  }
}
