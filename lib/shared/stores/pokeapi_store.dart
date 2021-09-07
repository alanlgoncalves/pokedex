import 'package:mobx/mobx.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/models/pokemon_summary.dart';
import 'package:pokedex/shared/repositories/poke_api_repository.dart';

part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  PokeApiRepository _pokeApiRepository = PokeApiRepository();

  _PokeApiStoreBase() {
    this._fetchPokemonList();
    this._fetchFavoritesPokemons();
  }

  @observable
  List<PokemonSummary>? _pokemonsSummary;

  @observable
  ObservableList<PokemonSummary> _favoritesPokemonsSummary = ObservableList();

  @observable
  PokemonSummary? _pokemonSummary;

  @computed
  PokemonSummary? get pokemonSummary => _pokemonSummary;

  @observable
  List<Pokemon> _pokemons = [];

  @observable
  Pokemon? _pokemon;

  // TODO - Encapsulate into a filter object
  @observable
  Generation? _generationFilter;

  // TODO - Encapsulate into a filter object
  @observable
  String? _typeFilter;

  // TODO - Encapsulate into a filter object
  @observable
  String? _pokemonNameNumberFilter;

  @computed
  Pokemon? get pokemon => _pokemon;

  @computed
  List<PokemonSummary>? get pokemonsSummary {
    var pokemons = _pokemonsSummary;

    if (_generationFilter != null) {
      pokemons =
          pokemons!.where((it) => it.generation == _generationFilter).toList();
    }

    if (_typeFilter != null) {
      pokemons = pokemons!.where((it) => it.types[0] == _typeFilter).toList();
    }

    if (_pokemonNameNumberFilter != null) {
      pokemons = pokemons!
          .where((it) =>
              it.name
                  .toLowerCase()
                  .contains(_pokemonNameNumberFilter!.toLowerCase()) ||
              it.number.contains(_pokemonNameNumberFilter!))
          .toList();
    }

    return pokemons;
  }

  @computed
  int get index =>
      pokemonsSummary!.indexWhere((it) => it.number == _pokemon!.number);

  // TODO - Encapsulate into a filter object
  @computed
  Generation? get generationFilter => _generationFilter;

  // TODO - Encapsulate into a filter object
  @computed
  String? get typeFilter => _typeFilter;

  // TODO - Encapsulate into a filter object
  @computed
  String? get pokemonNameNumberFilter => _pokemonNameNumberFilter;

  @computed
  List<PokemonSummary> get favoritesPokemonsSummary =>
      _favoritesPokemonsSummary;

  @action
  Future<void> setPokemon(int index) async {
    _pokemonSummary = pokemonsSummary![index];

    final pokemonDetailsIndex =
        _pokemons.indexWhere((it) => it.number == _pokemonSummary!.number);

    if (pokemonDetailsIndex < 0) {
      final fetchedPokemon =
          await _pokeApiRepository.fetchPokemon(_pokemonSummary!.number);

      final sortedPokemonList = [..._pokemons, fetchedPokemon];
      sortedPokemonList.sort((a, b) => a.number.compareTo(b.number));

      _pokemons = sortedPokemonList;
      _pokemon = fetchedPokemon;
    } else {
      _pokemon = _pokemons[pokemonDetailsIndex];
    }
  }

  @action
  void addFavoritePokemon(String number) {
    final indexFavorite =
        _favoritesPokemonsSummary.indexWhere((it) => it.number == number);

    final indexAll = _pokemonsSummary!.indexWhere((it) => it.number == number);

    if (indexFavorite < 0 && indexAll >= 0) {
      _favoritesPokemonsSummary.add(_pokemonsSummary![indexAll]);
    }

    _favoritesPokemonsSummary.sort((a, b) => a.number.compareTo(b.number));

    _pokeApiRepository.saveFavoritePokemonSummary(
        _favoritesPokemonsSummary.map((it) => it.number).toList());
  }

  @action
  void removeFavoritePokemon(String number) {
    final index =
        _favoritesPokemonsSummary.indexWhere((it) => it.number == number);

    if (index >= 0) {
      _favoritesPokemonsSummary.removeAt(index);
    }

    _pokeApiRepository.saveFavoritePokemonSummary(
        _favoritesPokemonsSummary.map((it) => it.number).toList());
  }

  @action
  void addGenerationFilter(Generation generationFilter) {
    _generationFilter = generationFilter;
  }

  @action
  void clearGenerationFilter() {
    _generationFilter = null;
  }

  @action
  void addTypeFilter(String type) {
    _typeFilter = type;
  }

  @action
  void clearTypeFilter() {
    _typeFilter = null;
  }

  @action
  void setNameNumberFilter(String nameNumberFilter) {
    _pokemonNameNumberFilter = nameNumberFilter;
  }

  @action
  void clearNameNumberFilter() {
    _pokemonNameNumberFilter = null;
  }

  Future<void> previousPokemon() async {
    final pokemonIndex =
        pokemonsSummary!.indexWhere((it) => it.number == _pokemon!.number);

    await setPokemon(pokemonIndex - 1);
  }

  Future<void> nextPokemon() async {
    final pokemonIndex =
        pokemonsSummary!.indexWhere((it) => it.number == _pokemon!.number);

    await setPokemon(pokemonIndex + 1);
  }

  PokemonSummary getPokemon(int index) => pokemonsSummary![index];

  bool isFavorite(String number) {
    final index =
        _favoritesPokemonsSummary.indexWhere((it) => it.number == number);

    if (index < 0) {
      return false;
    }

    return true;
  }

  _fetchPokemonList() async {
    _pokemonsSummary = await _pokeApiRepository.fetchPokemonsSummary();
  }

  void _fetchFavoritesPokemons() async {
    final favorites = await _pokeApiRepository.fetchFavoritesPokemonsSummary();

    _favoritesPokemonsSummary = ObservableList.of(_pokemonsSummary!
        .where((it) => favorites.contains(it.number))
        .toList());
  }
}
