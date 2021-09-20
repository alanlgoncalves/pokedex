import 'package:dio/dio.dart';
import 'package:pokedex/shared/models/item.dart';
import 'package:pokedex/shared/utils/api_constants.dart';

class ItemRepository {
  final Dio dio;

  ItemRepository(this.dio);

  Future<List<Item>> fetchItems() async {
    try {
      final response = await dio.get(ApiConstants.pokemonItems);

      return List<Item>.from(
        response.data.map(
          (model) => Item.fromMap(model),
        ),
      );
    } catch (e) {
      throw e;
    }
  }
}
