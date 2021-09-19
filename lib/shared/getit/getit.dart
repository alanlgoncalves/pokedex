import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/home/home_page_store.dart';
import 'package:pokedex/shared/stores/item_store/item_store.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';

void registerOnGetIt() {
  GetIt getIt = GetIt.instance;

  if (!GetIt.I.isRegistered<PokemonStore>()) {
    getIt.registerSingleton<PokemonStore>(PokemonStore());
  }

  if (!GetIt.I.isRegistered<ItemStore>()) {
    getIt.registerSingleton<ItemStore>(ItemStore());
  }

  if (!GetIt.I.isRegistered<HomePageStore>()) {
    getIt.registerSingleton<HomePageStore>(HomePageStore());
  }
}
