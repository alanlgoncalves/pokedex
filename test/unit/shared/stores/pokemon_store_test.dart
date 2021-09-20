import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/models/pokemon_summary.dart';
import 'package:pokedex/shared/repositories/pokemon_repository.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';

import '../../../mocks/pokemons_mock.dart';
import 'pokemon_store_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  PokemonRepository pokemonRepositoryMock = MockPokemonRepository();

  setUp(() {
    when(pokemonRepositoryMock.fetchPokemonsSummary()).thenAnswer(
      (_) async => List<PokemonSummary>.from(
        json.decode(pokemonsSummaryJson).map(
              (model) => PokemonSummary.fromJson(model),
            ),
      ),
    );

    GetIt getIt = GetIt.instance;

    if (!GetIt.I.isRegistered<PokemonRepository>()) {
      getIt.registerSingleton<PokemonRepository>(pokemonRepositoryMock);
    }
  });

  test("Should set empty list with null filter when item store initialize", () {
    PokemonStore pokemonStore = PokemonStore();

    expect(pokemonStore.pokemonsSummary, null);
    expect(pokemonStore.favoritesPokemonsSummary.length, 0);
    expect(pokemonStore.pokemonFilter.generationFilter, null);
    expect(pokemonStore.pokemonFilter.typeFilter, null);
    expect(pokemonStore.pokemonFilter.pokemonNameNumberFilter, null);
  });

  test("Should get pokemons when call fetch Pokemons data", () async {
    when(pokemonRepositoryMock.fetchFavoritesPokemonsSummary())
        .thenAnswer((_) async => []);

    PokemonStore pokemonStore = PokemonStore();
    await pokemonStore.fetchPokemonData();

    expect(pokemonStore.pokemonsSummary!.length, 6);
    expect(pokemonStore.favoritesPokemonsSummary.length, 0);
    expect(pokemonStore.pokemonFilter.generationFilter, null);
    expect(pokemonStore.pokemonFilter.typeFilter, null);
    expect(pokemonStore.pokemonFilter.pokemonNameNumberFilter, null);
  });

  test("Should filter Pokemons by Fire type", () async {
    when(pokemonRepositoryMock.fetchFavoritesPokemonsSummary())
        .thenAnswer((_) async => []);

    PokemonStore pokemonStore = PokemonStore();
    await pokemonStore.fetchPokemonData();

    expect(pokemonStore.pokemonsSummary!.length, 6);

    List<PokemonSummary> filteredPokemons = [];
    mobx.reaction((_) => pokemonStore.pokemonsSummary, (_) {
      filteredPokemons.addAll(pokemonStore.pokemonsSummary!);
    });

    pokemonStore.addTypeFilter("Fire");

    expect(filteredPokemons.length, 2);
    expect(filteredPokemons[0].number, "004");
    expect(filteredPokemons[1].number, "155");
  });

  test("Should filter Pokemons by generation", () async {
    when(pokemonRepositoryMock.fetchFavoritesPokemonsSummary())
        .thenAnswer((_) async => []);

    PokemonStore pokemonStore = PokemonStore();
    await pokemonStore.fetchPokemonData();

    expect(pokemonStore.pokemonsSummary!.length, 6);

    List<PokemonSummary> filteredPokemons = [];
    mobx.reaction((_) => pokemonStore.pokemonsSummary, (_) {
      filteredPokemons.addAll(pokemonStore.pokemonsSummary!);
    });

    pokemonStore.addGenerationFilter(Generation.GENERATION_II);

    expect(filteredPokemons.length, 3);
    expect(filteredPokemons[0].number, "152");
    expect(filteredPokemons[1].number, "155");
    expect(filteredPokemons[2].number, "158");
  });

  test("Should filter Pokemons by name sufix", () async {
    when(pokemonRepositoryMock.fetchFavoritesPokemonsSummary())
        .thenAnswer((_) async => []);

    PokemonStore pokemonStore = PokemonStore();
    await pokemonStore.fetchPokemonData();

    expect(pokemonStore.pokemonsSummary!.length, 6);

    List<PokemonSummary> filteredPokemons = [];
    mobx.reaction((_) => pokemonStore.pokemonsSummary, (_) {
      filteredPokemons.addAll(pokemonStore.pokemonsSummary!);
    });

    pokemonStore.setNameNumberFilter("cynd");

    expect(filteredPokemons.length, 1);
    expect(filteredPokemons[0].number, "155");
  });

  test("Should filter Pokemons by number", () async {
    when(pokemonRepositoryMock.fetchFavoritesPokemonsSummary())
        .thenAnswer((_) async => []);

    PokemonStore pokemonStore = PokemonStore();
    await pokemonStore.fetchPokemonData();

    expect(pokemonStore.pokemonsSummary!.length, 6);

    List<PokemonSummary> filteredPokemons = [];
    mobx.reaction((_) => pokemonStore.pokemonsSummary, (_) {
      filteredPokemons.addAll(pokemonStore.pokemonsSummary!);
    });

    pokemonStore.setNameNumberFilter("4");

    expect(filteredPokemons.length, 1);
    expect(filteredPokemons[0].number, "004");
  });

  test("Should filter Pokemons by water type, generation II and name Totodile",
      () async {
    when(pokemonRepositoryMock.fetchFavoritesPokemonsSummary())
        .thenAnswer((_) async => []);

    PokemonStore pokemonStore = PokemonStore();
    await pokemonStore.fetchPokemonData();

    expect(pokemonStore.pokemonsSummary!.length, 6);

    List<PokemonSummary> filteredPokemonsByType = [];
    mobx.reaction((_) => pokemonStore.pokemonsSummary, (_) {
      filteredPokemonsByType = pokemonStore.pokemonsSummary!;
    });

    pokemonStore.addTypeFilter("Water");

    expect(filteredPokemonsByType.length, 2);
    expect(filteredPokemonsByType[0].number, "007");
    expect(filteredPokemonsByType[1].number, "158");

    List<PokemonSummary> filteredPokemonsByTypeAmdGeneration = [];
    mobx.reaction((_) => pokemonStore.pokemonsSummary, (_) {
      filteredPokemonsByTypeAmdGeneration = pokemonStore.pokemonsSummary!;
    });

    pokemonStore.addGenerationFilter(Generation.GENERATION_II);

    expect(filteredPokemonsByTypeAmdGeneration.length, 1);
    expect(filteredPokemonsByTypeAmdGeneration[0].number, "158");

    List<PokemonSummary> filteredPokemonsByTypeAmdGenerationAndName = [];
    mobx.reaction((_) => pokemonStore.pokemonsSummary, (_) {
      filteredPokemonsByTypeAmdGenerationAndName =
          pokemonStore.pokemonsSummary!;
    });

    pokemonStore.setNameNumberFilter("Totodile");

    expect(filteredPokemonsByTypeAmdGenerationAndName.length, 1);
    expect(filteredPokemonsByTypeAmdGenerationAndName[0].number, "158");
  });

  test("Should return all Pokemons when clear filters", () async {
    when(pokemonRepositoryMock.fetchFavoritesPokemonsSummary())
        .thenAnswer((_) async => []);

    PokemonStore pokemonStore = PokemonStore();
    await pokemonStore.fetchPokemonData();

    List<PokemonSummary> filteredPokemons = [];
    mobx.reaction((_) => pokemonStore.pokemonsSummary, (_) {
      filteredPokemons = pokemonStore.pokemonsSummary!;
    });

    pokemonStore.addTypeFilter("Water");
    pokemonStore.addGenerationFilter(Generation.GENERATION_II);
    pokemonStore.setNameNumberFilter("Totodile");

    expect(pokemonStore.pokemonsSummary!.length, 1);

    pokemonStore.clearTypeFilter();
    pokemonStore.clearGenerationFilter();
    pokemonStore.clearNameNumberFilter();

    expect(filteredPokemons.length, 6);
  });

  test("Should save pokemon as favorite with success", () async {
    when(pokemonRepositoryMock.fetchFavoritesPokemonsSummary())
        .thenAnswer((_) async => []);

    PokemonStore pokemonStore = PokemonStore();
    await pokemonStore.fetchPokemonData();

    expect(pokemonStore.pokemonsSummary!.length, 6);
    expect(pokemonStore.favoritesPokemonsSummary.length, 0);

    List<PokemonSummary> favoritesPokemons = [];
    mobx.reaction((_) => pokemonStore.favoritesPokemonsSummary, (_) {
      favoritesPokemons = pokemonStore.favoritesPokemonsSummary;
    });

    pokemonStore.addFavoritePokemon("004");

    verify(pokemonRepositoryMock.saveFavoritePokemonSummary(["004"])).called(1);

    expect(favoritesPokemons.length, 1);
  });

  test("Should remove pokemon as favorite with success", () async {
    when(pokemonRepositoryMock.fetchFavoritesPokemonsSummary())
        .thenAnswer((_) async => ["004"]);

    PokemonStore pokemonStore = PokemonStore();
    await pokemonStore.fetchPokemonData();

    expect(pokemonStore.pokemonsSummary!.length, 6);
    expect(pokemonStore.favoritesPokemonsSummary.length, 1);

    List<PokemonSummary> favoritesPokemons = [pokemonStore.pokemonsSummary![1]];
    mobx.reaction((_) => pokemonStore.favoritesPokemonsSummary, (_) {
      favoritesPokemons = pokemonStore.favoritesPokemonsSummary;
    });

    pokemonStore.removeFavoritePokemon("004");

    verify(pokemonRepositoryMock.saveFavoritePokemonSummary([])).called(1);

    expect(favoritesPokemons.length, 0);
  });

  test("Should return true to favorite Pokemon", () async {
    when(pokemonRepositoryMock.fetchFavoritesPokemonsSummary())
        .thenAnswer((_) async => ["004"]);

    PokemonStore pokemonStore = PokemonStore();
    await pokemonStore.fetchPokemonData();

    expect(pokemonStore.pokemonsSummary!.length, 6);
    expect(pokemonStore.favoritesPokemonsSummary.length, 1);

    expect(pokemonStore.isFavorite("004"), true);
  });

  test("Should return false to not favorite Pokemon", () async {
    when(pokemonRepositoryMock.fetchFavoritesPokemonsSummary())
        .thenAnswer((_) async => ["004"]);

    PokemonStore pokemonStore = PokemonStore();
    await pokemonStore.fetchPokemonData();

    expect(pokemonStore.pokemonsSummary!.length, 6);
    expect(pokemonStore.favoritesPokemonsSummary.length, 1);

    expect(pokemonStore.isFavorite("001"), false);
  });

  test("Should fetch all data from choose Pokemon", () async {
    when(pokemonRepositoryMock.fetchFavoritesPokemonsSummary())
        .thenAnswer((_) async => []);

    PokemonStore pokemonStore = PokemonStore();
    await pokemonStore.fetchPokemonData();

    expect(pokemonStore.pokemonsSummary!.length, 6);
    expect(pokemonStore.favoritesPokemonsSummary.length, 0);

    final charmander = Pokemon.fromJson(jsonDecode(charmanderJson));
    when(pokemonRepositoryMock.fetchPokemon("004"))
        .thenAnswer((realInvocation) async => charmander);

    await pokemonStore.setPokemon(1);

    expect(pokemonStore.pokemon, equals(charmander));
    expect(pokemonStore.pokemonSummary!.number, charmander.number);
    expect(pokemonStore.index, 1);
  });

  test("Should fetch all data from choose Pokemon twice times", () async {
    when(pokemonRepositoryMock.fetchFavoritesPokemonsSummary())
        .thenAnswer((_) async => []);

    PokemonStore pokemonStore = PokemonStore();
    await pokemonStore.fetchPokemonData();

    expect(pokemonStore.pokemonsSummary!.length, 6);
    expect(pokemonStore.favoritesPokemonsSummary.length, 0);

    final charmander = Pokemon.fromJson(jsonDecode(charmanderJson));
    when(pokemonRepositoryMock.fetchPokemon("004"))
        .thenAnswer((realInvocation) async => charmander);

    await pokemonStore.setPokemon(1);

    expect(pokemonStore.pokemon, equals(charmander));
    expect(pokemonStore.pokemonSummary!.number, charmander.number);
    expect(pokemonStore.index, 1);

    await pokemonStore.setPokemon(1);

    expect(pokemonStore.pokemon, equals(charmander));
    expect(pokemonStore.pokemonSummary!.number, charmander.number);
    expect(pokemonStore.index, 1);
  });

  test("Should fetch all data from previous Pokemon", () async {
    when(pokemonRepositoryMock.fetchFavoritesPokemonsSummary())
        .thenAnswer((_) async => []);

    PokemonStore pokemonStore = PokemonStore();
    await pokemonStore.fetchPokemonData();

    expect(pokemonStore.pokemonsSummary!.length, 6);
    expect(pokemonStore.favoritesPokemonsSummary.length, 0);

    final charmander = Pokemon.fromJson(jsonDecode(charmanderJson));
    when(pokemonRepositoryMock.fetchPokemon("004"))
        .thenAnswer((realInvocation) async => charmander);

    await pokemonStore.setPokemon(1);

    expect(pokemonStore.pokemon, equals(charmander));
    expect(pokemonStore.pokemonSummary!.number, charmander.number);
    expect(pokemonStore.index, 1);

    final bulbasaur = Pokemon.fromJson(jsonDecode(bulbasaurJson));
    when(pokemonRepositoryMock.fetchPokemon("001"))
        .thenAnswer((realInvocation) async => bulbasaur);

    await pokemonStore.previousPokemon();

    expect(pokemonStore.pokemon, equals(bulbasaur));
    expect(pokemonStore.pokemonSummary!.number, bulbasaur.number);
    expect(pokemonStore.index, 0);
  });

  test("Should fetch all data from next Pokemon", () async {
    when(pokemonRepositoryMock.fetchFavoritesPokemonsSummary())
        .thenAnswer((_) async => []);

    PokemonStore pokemonStore = PokemonStore();
    await pokemonStore.fetchPokemonData();

    expect(pokemonStore.pokemonsSummary!.length, 6);
    expect(pokemonStore.favoritesPokemonsSummary.length, 0);

    final charmander = Pokemon.fromJson(jsonDecode(charmanderJson));
    when(pokemonRepositoryMock.fetchPokemon("004"))
        .thenAnswer((realInvocation) async => charmander);

    await pokemonStore.setPokemon(1);

    expect(pokemonStore.pokemon, equals(charmander));
    expect(pokemonStore.pokemonSummary!.number, charmander.number);
    expect(pokemonStore.index, 1);

    final squirtle = Pokemon.fromJson(jsonDecode(squirtleJson));
    when(pokemonRepositoryMock.fetchPokemon("007"))
        .thenAnswer((realInvocation) async => squirtle);

    await pokemonStore.nextPokemon();

    expect(pokemonStore.pokemon, equals(squirtle));
    expect(pokemonStore.pokemonSummary!.number, squirtle.number);
    expect(pokemonStore.index, 2);
  });

  test("Should return Pokemon summary data from specific index", () async {
    when(pokemonRepositoryMock.fetchFavoritesPokemonsSummary())
        .thenAnswer((_) async => []);

    PokemonStore pokemonStore = PokemonStore();
    await pokemonStore.fetchPokemonData();

    expect(pokemonStore.pokemonsSummary!.length, 6);
    expect(pokemonStore.favoritesPokemonsSummary.length, 0);

    final firstPokemon = pokemonStore.getPokemon(0);
    expect(firstPokemon.number, "001");

    final secondsPokemon = pokemonStore.getPokemon(1);
    expect(secondsPokemon.number, "004");

    final thirdPokemon = pokemonStore.getPokemon(2);
    expect(thirdPokemon.number, "007");
  });
}
