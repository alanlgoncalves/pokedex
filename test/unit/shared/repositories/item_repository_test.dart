import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/shared/repositories/item_repository.dart';
import 'package:pokedex/shared/utils/api_constants.dart';

import 'item_repository_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late Dio dio;
  late ItemRepository itemRepository;

  setUp(() {
    dio = MockDio();
    itemRepository = ItemRepository(dio);
  });

  test("Should return items list with success", () async {
    when(dio.get(ApiConstants.pokemonItems)).thenAnswer((_) async => Response(
        data: jsonDecode(itemsJson),
        requestOptions: RequestOptions(path: ApiConstants.pokemonItems)));

    final items = await itemRepository.fetchItems();

    expect(items.length, 2);

    expect(items[0].name, "Master Ball");
    expect(items[0].imageUrl,
        "https://pokedex.alansantos.dev/assets/items/master-ball.png");
    expect(items[0].category, "Pokeballs");
    expect(items[0].effect,
        "The best Ball with the ultimate level of performance. It will catch any wild Pokémon without fail.");
  });

  test("Should return empty list when API return empty list", () async {
    when(dio.get(ApiConstants.pokemonItems)).thenAnswer((_) async => Response(
        data: jsonDecode("[]"),
        requestOptions: RequestOptions(path: ApiConstants.pokemonItems)));

    final items = await itemRepository.fetchItems();

    expect(items.length, 0);
  });
}

const itemsJson = """
  [
    {
      "name": "Master Ball",
      "imageUrl": "https://pokedex.alansantos.dev/assets/items/master-ball.png",
      "category": "Pokeballs",
      "effect": "The best Ball with the ultimate level of performance. It will catch any wild Pokémon without fail."
    },
    {
      "name": "Ultra Ball",
      "imageUrl": "https://pokedex.alansantos.dev/assets/items/ultra-ball.png",
      "category": "Pokeballs",
      "effect": "An ultra-performance Ball that provides a higher Pokémon catch rate than a Great Ball."
    }
  ]
""";
