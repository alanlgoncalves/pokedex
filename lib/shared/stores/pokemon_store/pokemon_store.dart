import 'package:mobx/mobx.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/models/pokemon_filter.dart';
import 'package:pokedex/shared/models/pokemon_summary.dart';
import 'package:pokedex/shared/repositories/pokemon_repository.dart';

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  PokemonRepository _pokemonRepository = PokemonRepository();

  _PokemonStoreBase() {
    this._fetchPokemonData();
  }

  @observable
  PokemonFilter _pokemonFilter = PokemonFilter();

  @observable
  List<PokemonSummary>? _pokemonsSummary;

  @observable
  ObservableList<PokemonSummary> _favoritesPokemonsSummary = ObservableList();

  @observable
  PokemonSummary? _pokemonSummary;

  @observable
  List<Pokemon> _pokemons = [];

  @observable
  Pokemon? _pokemon;

  @computed
  PokemonSummary? get pokemonSummary => _pokemonSummary;

  @computed
  Pokemon? get pokemon => _pokemon;

  @computed
  List<PokemonSummary>? get pokemonsSummary {
    return _pokemonFilter.filter(_pokemonsSummary);
  }

  @computed
  int get index =>
      pokemonsSummary!.indexWhere((it) => it.number == _pokemon!.number);

  @computed
  PokemonFilter get pokemonFilter => _pokemonFilter;

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
          await _pokemonRepository.fetchPokemon(_pokemonSummary!.number);

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

    _pokemonRepository.saveFavoritePokemonSummary(
        _favoritesPokemonsSummary.map((it) => it.number).toList());
  }

  @action
  void removeFavoritePokemon(String number) {
    final index =
        _favoritesPokemonsSummary.indexWhere((it) => it.number == number);

    if (index >= 0) {
      _favoritesPokemonsSummary.removeAt(index);
    }

    _pokemonRepository.saveFavoritePokemonSummary(
        _favoritesPokemonsSummary.map((it) => it.number).toList());
  }

  @action
  void addGenerationFilter(Generation generationFilter) {
    _pokemonFilter =
        _pokemonFilter.copyWith(generationFilter: generationFilter);
  }

  @action
  void clearGenerationFilter() {
    _pokemonFilter = PokemonFilter(
        pokemonNameNumberFilter: _pokemonFilter.pokemonNameNumberFilter,
        typeFilter: _pokemonFilter.typeFilter);
  }

  @action
  void addTypeFilter(String type) {
    _pokemonFilter = _pokemonFilter.copyWith(typeFilter: type);
  }

  @action
  void clearTypeFilter() {
    _pokemonFilter = PokemonFilter(
        pokemonNameNumberFilter: _pokemonFilter.pokemonNameNumberFilter,
        generationFilter: _pokemonFilter.generationFilter);
  }

  @action
  void setNameNumberFilter(String nameNumberFilter) {
    _pokemonFilter =
        _pokemonFilter.copyWith(pokemonNameNumberFilter: nameNumberFilter);
  }

  @action
  void clearNameNumberFilter() {
    _pokemonFilter = PokemonFilter(
        generationFilter: _pokemonFilter.generationFilter,
        typeFilter: _pokemonFilter.typeFilter);
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

    return index >= 0;
  }

  _fetchPokemonData() async {
    _pokemonsSummary = await _pokemonRepository.fetchPokemonsSummary();

    await _fetchFavoritesPokemons();
  }

  Future<void> _fetchFavoritesPokemons() async {
    final favorites = await _pokemonRepository.fetchFavoritesPokemonsSummary();

    _favoritesPokemonsSummary = ObservableList.of(_pokemonsSummary!
        .where((it) => favorites.contains(it.number))
        .toList());
  }
}
