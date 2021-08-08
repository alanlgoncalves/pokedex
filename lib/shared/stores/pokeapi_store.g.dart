// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  final _$pokeApiAtom = Atom(name: '_PokeApiStoreBase.pokeApi');

  @override
  PokeApi? get pokeApi {
    _$pokeApiAtom.reportRead();
    return super.pokeApi;
  }

  @override
  set pokeApi(PokeApi? value) {
    _$pokeApiAtom.reportWrite(value, super.pokeApi, () {
      super.pokeApi = value;
    });
  }

  final _$fetchPokemonListAsyncAction =
      AsyncAction('_PokeApiStoreBase.fetchPokemonList');

  @override
  Future fetchPokemonList() {
    return _$fetchPokemonListAsyncAction.run(() => super.fetchPokemonList());
  }

  @override
  String toString() {
    return '''
pokeApi: ${pokeApi}
    ''';
  }
}
