import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/shared/models/item.dart';
import 'package:pokedex/shared/repositories/item_repository.dart';
import 'package:pokedex/shared/stores/item_store/item_store.dart';

import 'item_store_test.mocks.dart';

@GenerateMocks([ItemRepository])
void main() {
  List<Item> items = [
    Item(
      name: "Master Ball",
      category: "Pokeballs",
      effect:
          "The best Ball with the ultimate level of performance. It will catch any wild Pokémon without fail.",
      imageUrl: "https://pokedex.alansantos.dev/assets/items/master-ball.png",
    ),
    Item(
      name: "Ultra Ball",
      category: "Pokeballs",
      effect:
          "An ultra-performance Ball that provides a higher Pokémon catch rate than a Great Ball.",
      imageUrl: "https://pokedex.alansantos.dev/assets/items/ultra-ball.png",
    ),
  ];

  ItemRepository itemRepositoryMock = MockItemRepository();

  setUp(() {
    when(itemRepositoryMock.fetchItems()).thenAnswer((_) async => items);

    GetIt getIt = GetIt.instance;

    if (!GetIt.I.isRegistered<ItemRepository>()) {
      getIt.registerSingleton<ItemRepository>(itemRepositoryMock);
    }
  });

  test("Should set empty list with null filter when item store initialize",
      () async {
    ItemStore itemStore = ItemStore();

    expect(itemStore.items.length, 0);
    expect(itemStore.filter, null);
  });

  test("Should get items when call fetch items", () async {
    ItemStore itemStore = ItemStore();
    await itemStore.fetchItems();

    expect(itemStore.items.length, 2);
    expect(itemStore.filter, null);
  });

  test("Should filter items when filter is added", () async {
    ItemStore itemStore = ItemStore();
    await itemStore.fetchItems();

    List<Item> items = [];

    mobx.reaction((_) => itemStore.items, (_) {
      items.addAll(itemStore.items);
    });

    itemStore.setFilter("mas");

    expect(items.length, 1);
    expect(items[0].name, "Master Ball");
  });

  test("Should return all items when filter is cleared", () async {
    ItemStore itemStore = ItemStore();
    await itemStore.fetchItems();
    itemStore.setFilter("mas");

    List<Item> items = [];

    mobx.reaction((_) => itemStore.items, (_) {
      items.addAll(itemStore.items);
    });

    itemStore.clearFilter();

    expect(items.length, 2);
  });
}
