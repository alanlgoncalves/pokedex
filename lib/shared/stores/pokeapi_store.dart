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
  }

  @observable
  List<PokemonSummary>? _pokemonsSummary;

  @observable
  PokemonSummary? _pokemonSummary;

  @computed
  PokemonSummary? get pokemonSummary => _pokemonSummary;

  @observable
  List<Pokemon> _pokemons = [];

  @observable
  Pokemon? _pokemon;

  @computed
  Pokemon? get pokemon => _pokemon;

  @computed
  List<PokemonSummary>? get pokemonsSummary {
    var pokemons = _pokemonsSummary;

    if (_generationFilter != null) {
      pokemons = _pokemonsSummary!
          .where((it) => it.generation == _generationFilter)
          .toList();
    }

    return pokemons;
  }

  @computed
  int get index =>
      pokemonsSummary!.indexWhere((it) => it.number == _pokemon!.number);

  @observable
  Generation? _generationFilter;

  @computed
  Generation? get generationFilter => _generationFilter;

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
  void addGenerationFilter(Generation generationFilter) {
    _generationFilter = generationFilter;
  }

  @action
  void clearGenerationFilter() {
    _generationFilter = null;
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

  _fetchPokemonList() async {
    _pokemonsSummary = await _pokeApiRepository.fetchPokemonsSummary();
  }
}
