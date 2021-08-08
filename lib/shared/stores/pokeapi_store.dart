import 'package:mobx/mobx.dart';
import 'package:pokedex/shared/models/poke_api.dart';
import 'package:pokedex/shared/repositories/poke_api_repository.dart';
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  PokeApiRepository pokeApiRepository = PokeApiRepository();

  _PokeApiStoreBase() {
    this.fetchPokemonList();
  }

  @observable
  PokeApi? pokeApi;

  @action
  fetchPokemonList() async {
    pokeApi = await pokeApiRepository.fetchPokemons();
  }
}
