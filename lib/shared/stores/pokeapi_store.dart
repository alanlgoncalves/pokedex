import 'package:mobx/mobx.dart';
import 'package:pokedex/shared/models/poke_api.dart';
import 'package:pokedex/shared/repositories/poke_api_repository.dart';
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  PokeApiRepository pokeApiRepository = PokeApiRepository();

  _PokeApiStoreBase() {
    this._fetchPokemonList();
  }

  @observable
  PokeApi? _pokeApi;

  @observable
  Pokemon? _pokemon;

  @computed
  PokeApi? get pokeApi => _pokeApi;

  Pokemon? get pokemon => _pokemon;

  @action
  void setPokemon(int index) => _pokemon = _pokeApi!.pokemon![index];

  Pokemon getPokemon(int index) => _pokeApi!.pokemon![index];

  _fetchPokemonList() async {
    _pokeApi = await pokeApiRepository.fetchPokemons();
  }
}
