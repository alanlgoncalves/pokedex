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
}

const pokemonsSummaryJson = """
    [
      {
          "number":"001",
          "name":"Bulbasaur",
          "imageUrl":"https://pokedex.alansantos.dev/assets/pokemons/images/001.png",
          "thumbnailUrl":"https://pokedex.alansantos.dev/assets/pokemons/thumbs/001.png",
          "sprites":{
            "mainSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/001/001_main.png",
            "frontAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/001/001_front_animated.gif",
            "backAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/001/001_back_animated.gif",
            "frontShinyAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/001/001_front_shiny_animated.gif",
            "backShinyAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/001/001_back_shiny_animated.gif"
          },
          "types":[
            "Grass",
            "Poison"
          ],
          "specie":"Seed",
          "generation":"GENERATION_I"
      },
      {
          "number":"004",
          "name":"Charmander",
          "imageUrl":"https://pokedex.alansantos.dev/assets/pokemons/images/004.png",
          "thumbnailUrl":"https://pokedex.alansantos.dev/assets/pokemons/thumbs/004.png",
          "sprites":{
            "mainSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/004/004_main.png",
            "frontAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/004/004_front_animated.gif",
            "backAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/004/004_back_animated.gif",
            "frontShinyAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/004/004_front_shiny_animated.gif",
            "backShinyAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/004/004_back_shiny_animated.gif"
          },
          "types":[
            "Fire"
          ],
          "specie":"Lizard",
          "generation":"GENERATION_I"
      },
      {
          "number":"007",
          "name":"Squirtle",
          "imageUrl":"https://pokedex.alansantos.dev/assets/pokemons/images/007.png",
          "thumbnailUrl":"https://pokedex.alansantos.dev/assets/pokemons/thumbs/007.png",
          "sprites":{
            "mainSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/007/007_main.png",
            "frontAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/007/007_front_animated.gif",
            "backAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/007/007_back_animated.gif",
            "frontShinyAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/007/007_front_shiny_animated.gif",
            "backShinyAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/007/007_back_shiny_animated.gif"
          },
          "types":[
            "Water"
          ],
          "specie":"Tiny Turtle",
          "generation":"GENERATION_I"
      },
      {
         "number":"152",
         "name":"Chikorita",
         "imageUrl":"https://pokedex.alansantos.dev/assets/pokemons/images/152.png",
         "thumbnailUrl":"https://pokedex.alansantos.dev/assets/pokemons/thumbs/152.png",
         "sprites":{
            "mainSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/152/152_main.png",
            "frontAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/152/152_front_animated.gif",
            "backAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/152/152_back_animated.gif",
            "frontShinyAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/152/152_front_shiny_animated.gif",
            "backShinyAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/152/152_back_shiny_animated.gif"
         },
         "types":[
            "Grass"
         ],
         "specie":"Leaf",
         "generation":"GENERATION_II"
      },
      {
         "number":"155",
         "name":"Cyndaquil",
         "imageUrl":"https://pokedex.alansantos.dev/assets/pokemons/images/155.png",
         "thumbnailUrl":"https://pokedex.alansantos.dev/assets/pokemons/thumbs/155.png",
         "sprites":{
            "mainSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/155/155_main.png",
            "frontAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/155/155_front_animated.gif",
            "backAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/155/155_back_animated.gif",
            "frontShinyAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/155/155_front_shiny_animated.gif",
            "backShinyAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/155/155_back_shiny_animated.gif"
         },
         "types":[
            "Fire"
         ],
         "specie":"Fire Mouse",
         "generation":"GENERATION_II"
      },
      {
         "number":"158",
         "name":"Totodile",
         "imageUrl":"https://pokedex.alansantos.dev/assets/pokemons/images/158.png",
         "thumbnailUrl":"https://pokedex.alansantos.dev/assets/pokemons/thumbs/158.png",
         "sprites":{
            "mainSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/158/158_main.png",
            "frontAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/158/158_front_animated.gif",
            "backAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/158/158_back_animated.gif",
            "frontShinyAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/158/158_front_shiny_animated.gif",
            "backShinyAnimatedSpriteUrl":"https://pokedex.alansantos.dev/assets/pokemons/sprites/158/158_back_shiny_animated.gif"
         },
         "types":[
            "Water"
         ],
         "specie":"Big Jaw",
         "generation":"GENERATION_II"
      }
    ]
  """;
