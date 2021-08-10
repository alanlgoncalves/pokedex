import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
  PokeApi? _pokeApi;

  @observable
  int _index = 0;

  @computed
  PokeApi? get pokeApi => _pokeApi;

  @computed
  Pokemon get pokemon => _pokeApi!.pokemon![_index];

  @action
  void setIndex(int index) => _index = index;

  @action
  fetchPokemonList() async {
    _pokeApi = await pokeApiRepository.fetchPokemons();
  }

  @computed
  Widget get pokemonImage {
    return CachedNetworkImage(
      imageUrl:
          "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${(_index + 1).toString().padLeft(3, '0')}.png",
    );
  }
}
