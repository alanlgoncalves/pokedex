// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonStore on _PokemonStoreBase, Store {
  Computed<PokemonSummary?>? _$pokemonSummaryComputed;

  @override
  PokemonSummary? get pokemonSummary => (_$pokemonSummaryComputed ??=
          Computed<PokemonSummary?>(() => super.pokemonSummary,
              name: '_PokemonStoreBase.pokemonSummary'))
      .value;
  Computed<Pokemon?>? _$pokemonComputed;

  @override
  Pokemon? get pokemon =>
      (_$pokemonComputed ??= Computed<Pokemon?>(() => super.pokemon,
              name: '_PokemonStoreBase.pokemon'))
          .value;
  Computed<List<PokemonSummary>?>? _$pokemonsSummaryComputed;

  @override
  List<PokemonSummary>? get pokemonsSummary => (_$pokemonsSummaryComputed ??=
          Computed<List<PokemonSummary>?>(() => super.pokemonsSummary,
              name: '_PokemonStoreBase.pokemonsSummary'))
      .value;
  Computed<int>? _$indexComputed;

  @override
  int get index => (_$indexComputed ??=
          Computed<int>(() => super.index, name: '_PokemonStoreBase.index'))
      .value;
  Computed<PokemonFilter>? _$pokemonFilterComputed;

  @override
  PokemonFilter get pokemonFilter => (_$pokemonFilterComputed ??=
          Computed<PokemonFilter>(() => super.pokemonFilter,
              name: '_PokemonStoreBase.pokemonFilter'))
      .value;
  Computed<List<PokemonSummary>>? _$favoritesPokemonsSummaryComputed;

  @override
  List<PokemonSummary> get favoritesPokemonsSummary =>
      (_$favoritesPokemonsSummaryComputed ??= Computed<List<PokemonSummary>>(
              () => super.favoritesPokemonsSummary,
              name: '_PokemonStoreBase.favoritesPokemonsSummary'))
          .value;

  late final _$_pokemonFilterAtom =
      Atom(name: '_PokemonStoreBase._pokemonFilter', context: context);

  @override
  PokemonFilter get _pokemonFilter {
    _$_pokemonFilterAtom.reportRead();
    return super._pokemonFilter;
  }

  @override
  set _pokemonFilter(PokemonFilter value) {
    _$_pokemonFilterAtom.reportWrite(value, super._pokemonFilter, () {
      super._pokemonFilter = value;
    });
  }

  late final _$_pokemonsSummaryAtom =
      Atom(name: '_PokemonStoreBase._pokemonsSummary', context: context);

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

  late final _$_favoritesPokemonsSummaryAtom = Atom(
      name: '_PokemonStoreBase._favoritesPokemonsSummary', context: context);

  @override
  ObservableList<PokemonSummary> get _favoritesPokemonsSummary {
    _$_favoritesPokemonsSummaryAtom.reportRead();
    return super._favoritesPokemonsSummary;
  }

  @override
  set _favoritesPokemonsSummary(ObservableList<PokemonSummary> value) {
    _$_favoritesPokemonsSummaryAtom
        .reportWrite(value, super._favoritesPokemonsSummary, () {
      super._favoritesPokemonsSummary = value;
    });
  }

  late final _$_pokemonSummaryAtom =
      Atom(name: '_PokemonStoreBase._pokemonSummary', context: context);

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

  late final _$_pokemonsAtom =
      Atom(name: '_PokemonStoreBase._pokemons', context: context);

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

  late final _$_pokemonAtom =
      Atom(name: '_PokemonStoreBase._pokemon', context: context);

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

  late final _$setPokemonAsyncAction =
      AsyncAction('_PokemonStoreBase.setPokemon', context: context);

  @override
  Future<void> setPokemon(int index) {
    return _$setPokemonAsyncAction.run(() => super.setPokemon(index));
  }

  late final _$fetchPokemonDataAsyncAction =
      AsyncAction('_PokemonStoreBase.fetchPokemonData', context: context);

  @override
  Future<void> fetchPokemonData() {
    return _$fetchPokemonDataAsyncAction.run(() => super.fetchPokemonData());
  }

  late final _$_PokemonStoreBaseActionController =
      ActionController(name: '_PokemonStoreBase', context: context);

  @override
  void addFavoritePokemon(String number) {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.addFavoritePokemon');
    try {
      return super.addFavoritePokemon(number);
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFavoritePokemon(String number) {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.removeFavoritePokemon');
    try {
      return super.removeFavoritePokemon(number);
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addGenerationFilter(Generation generationFilter) {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.addGenerationFilter');
    try {
      return super.addGenerationFilter(generationFilter);
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearGenerationFilter() {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.clearGenerationFilter');
    try {
      return super.clearGenerationFilter();
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTypeFilter(String type) {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.addTypeFilter');
    try {
      return super.addTypeFilter(type);
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearTypeFilter() {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.clearTypeFilter');
    try {
      return super.clearTypeFilter();
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNameNumberFilter(String nameNumberFilter) {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.setNameNumberFilter');
    try {
      return super.setNameNumberFilter(nameNumberFilter);
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearNameNumberFilter() {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.clearNameNumberFilter');
    try {
      return super.clearNameNumberFilter();
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonSummary: ${pokemonSummary},
pokemon: ${pokemon},
pokemonsSummary: ${pokemonsSummary},
index: ${index},
pokemonFilter: ${pokemonFilter},
favoritesPokemonsSummary: ${favoritesPokemonsSummary}
    ''';
  }
}
