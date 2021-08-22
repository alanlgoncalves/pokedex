// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<PokemonSummary?>? _$pokemonSummaryComputed;

  @override
  PokemonSummary? get pokemonSummary => (_$pokemonSummaryComputed ??=
          Computed<PokemonSummary?>(() => super.pokemonSummary,
              name: '_PokeApiStoreBase.pokemonSummary'))
      .value;
  Computed<Pokemon?>? _$pokemonComputed;

  @override
  Pokemon? get pokemon =>
      (_$pokemonComputed ??= Computed<Pokemon?>(() => super.pokemon,
              name: '_PokeApiStoreBase.pokemon'))
          .value;
  Computed<List<PokemonSummary>?>? _$pokemonsSummaryComputed;

  @override
  List<PokemonSummary>? get pokemonsSummary => (_$pokemonsSummaryComputed ??=
          Computed<List<PokemonSummary>?>(() => super.pokemonsSummary,
              name: '_PokeApiStoreBase.pokemonsSummary'))
      .value;
  Computed<int>? _$indexComputed;

  @override
  int get index => (_$indexComputed ??=
          Computed<int>(() => super.index, name: '_PokeApiStoreBase.index'))
      .value;

  final _$_pokemonsSummaryAtom =
      Atom(name: '_PokeApiStoreBase._pokemonsSummary');

  @override
  List<PokemonSummary>? get _pokemonsSummary {
    _$_pokemonsSummaryAtom.reportRead();
    return super._pokemonsSummary;
  }

  @override
  set _pokemonsSummary(List<PokemonSummary>? value) {
    _$_pokemonsSummaryAtom.reportWrite(value, super._pokemonsSummary, () {
      super._pokemonsSummary = value;
    });
  }

  final _$_pokemonSummaryAtom = Atom(name: '_PokeApiStoreBase._pokemonSummary');

  @override
  PokemonSummary? get _pokemonSummary {
    _$_pokemonSummaryAtom.reportRead();
    return super._pokemonSummary;
  }

  @override
  set _pokemonSummary(PokemonSummary? value) {
    _$_pokemonSummaryAtom.reportWrite(value, super._pokemonSummary, () {
      super._pokemonSummary = value;
    });
  }

  final _$_pokemonsAtom = Atom(name: '_PokeApiStoreBase._pokemons');

  @override
  List<Pokemon> get _pokemons {
    _$_pokemonsAtom.reportRead();
    return super._pokemons;
  }

  @override
  set _pokemons(List<Pokemon> value) {
    _$_pokemonsAtom.reportWrite(value, super._pokemons, () {
      super._pokemons = value;
    });
  }

  final _$_pokemonAtom = Atom(name: '_PokeApiStoreBase._pokemon');

  @override
  Pokemon? get _pokemon {
    _$_pokemonAtom.reportRead();
    return super._pokemon;
  }

  @override
  set _pokemon(Pokemon? value) {
    _$_pokemonAtom.reportWrite(value, super._pokemon, () {
      super._pokemon = value;
    });
  }

  final _$setPokemonAsyncAction = AsyncAction('_PokeApiStoreBase.setPokemon');

  @override
  Future<void> setPokemon(int index) {
    return _$setPokemonAsyncAction.run(() => super.setPokemon(index));
  }

  @override
  String toString() {
    return '''
pokemonSummary: ${pokemonSummary},
pokemon: ${pokemon},
pokemonsSummary: ${pokemonsSummary},
index: ${index}
    ''';
  }
}
