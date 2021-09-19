import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/shared/repositories/pokemon_repository.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';

import 'pokemon_store_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  PokemonRepository pokemonRepositoryMock = MockPokemonRepository();

  setUp(() {
    when(pokemonRepositoryMock.fetchPokemonsSummary())
        .thenAnswer((_) async => []);

    GetIt getIt = GetIt.instance;

    if (!GetIt.I.isRegistered<PokemonRepository>()) {
      getIt.registerSingleton<PokemonRepository>(pokemonRepositoryMock);
    }
  });

  test("Should set empty list with null filter when item store initialize", () {
    PokemonStore pokemonStore = PokemonStore();

    expect(pokemonStore.pokemonsSummary, null);
    expect(pokemonStore.pokemonFilter.generationFilter, null);
    expect(pokemonStore.pokemonFilter.typeFilter, null);
    expect(pokemonStore.pokemonFilter.pokemonNameNumberFilter, null);
  });
}
