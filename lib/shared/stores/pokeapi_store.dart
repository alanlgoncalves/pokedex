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
  List<PokemonSummary>? get pokemonsSummary => _pokemonsSummary;

  @computed
  int get index =>
      _pokemonsSummary!.indexWhere((it) => it.number == _pokemon!.number);

  @action
  Future<void> setPokemon(int index) async {
    _pokemonSummary = _pokemonsSummary![index];

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

  Future<void> previousPokemon() async {
    final pokemonIndex =
        _pokemonsSummary!.indexWhere((it) => it.number == _pokemon!.number);

    await setPokemon(pokemonIndex - 1);
  }

  Future<void> nextPokemon() async {
    final pokemonIndex =
        _pokemonsSummary!.indexWhere((it) => it.number == _pokemon!.number);

    await setPokemon(pokemonIndex + 1);
  }

  PokemonSummary getPokemon(int index) => _pokemonsSummary![index];

  _fetchPokemonList() async {
    _pokemonsSummary = await _pokeApiRepository.fetchPokemonsSummary();
  }
}
