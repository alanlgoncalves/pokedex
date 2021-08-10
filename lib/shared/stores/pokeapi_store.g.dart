// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<PokeApi?>? _$pokeApiComputed;

  @override
  PokeApi? get pokeApi =>
      (_$pokeApiComputed ??= Computed<PokeApi?>(() => super.pokeApi,
              name: '_PokeApiStoreBase.pokeApi'))
          .value;
  Computed<Pokemon>? _$pokemonComputed;

  @override
  Pokemon get pokemon =>
      (_$pokemonComputed ??= Computed<Pokemon>(() => super.pokemon,
              name: '_PokeApiStoreBase.pokemon'))
          .value;
  Computed<Widget>? _$pokemonImageComputed;

  @override
  Widget get pokemonImage =>
      (_$pokemonImageComputed ??= Computed<Widget>(() => super.pokemonImage,
              name: '_PokeApiStoreBase.pokemonImage'))
          .value;

  final _$_pokeApiAtom = Atom(name: '_PokeApiStoreBase._pokeApi');

  @override
  PokeApi? get _pokeApi {
    _$_pokeApiAtom.reportRead();
    return super._pokeApi;
  }

  @override
  set _pokeApi(PokeApi? value) {
    _$_pokeApiAtom.reportWrite(value, super._pokeApi, () {
      super._pokeApi = value;
    });
  }

  final _$_indexAtom = Atom(name: '_PokeApiStoreBase._index');

  @override
  int get _index {
    _$_indexAtom.reportRead();
    return super._index;
  }

  @override
  set _index(int value) {
    _$_indexAtom.reportWrite(value, super._index, () {
      super._index = value;
    });
  }

  final _$fetchPokemonListAsyncAction =
      AsyncAction('_PokeApiStoreBase.fetchPokemonList');

  @override
  Future fetchPokemonList() {
    return _$fetchPokemonListAsyncAction.run(() => super.fetchPokemonList());
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  void setIndex(int index) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.setIndex');
    try {
      return super.setIndex(index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokeApi: ${pokeApi},
pokemon: ${pokemon},
pokemonImage: ${pokemonImage}
    ''';
  }
}
