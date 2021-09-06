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
  Computed<Generation?>? _$generationFilterComputed;

  @override
  Generation? get generationFilter => (_$generationFilterComputed ??=
          Computed<Generation?>(() => super.generationFilter,
              name: '_PokeApiStoreBase.generationFilter'))
      .value;
  Computed<String?>? _$typeFilterComputed;

  @override
  String? get typeFilter =>
      (_$typeFilterComputed ??= Computed<String?>(() => super.typeFilter,
              name: '_PokeApiStoreBase.typeFilter'))
          .value;
  Computed<String?>? _$pokemonNameNumberFilterComputed;

  @override
  String? get pokemonNameNumberFilter => (_$pokemonNameNumberFilterComputed ??=
          Computed<String?>(() => super.pokemonNameNumberFilter,
              name: '_PokeApiStoreBase.pokemonNameNumberFilter'))
      .value;
  Computed<List<PokemonSummary>>? _$favoritesPokemonsSummaryComputed;

  @override
  List<PokemonSummary> get favoritesPokemonsSummary =>
      (_$favoritesPokemonsSummaryComputed ??= Computed<List<PokemonSummary>>(
              () => super.favoritesPokemonsSummary,
              name: '_PokeApiStoreBase.favoritesPokemonsSummary'))
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

  final _$_favoritesPokemonsSummaryAtom =
      Atom(name: '_PokeApiStoreBase._favoritesPokemonsSummary');

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

  final _$_generationFilterAtom =
      Atom(name: '_PokeApiStoreBase._generationFilter');

  @override
  Generation? get _generationFilter {
    _$_generationFilterAtom.reportRead();
    return super._generationFilter;
  }

  @override
  set _generationFilter(Generation? value) {
    _$_generationFilterAtom.reportWrite(value, super._generationFilter, () {
      super._generationFilter = value;
    });
  }

  final _$_typeFilterAtom = Atom(name: '_PokeApiStoreBase._typeFilter');

  @override
  String? get _typeFilter {
    _$_typeFilterAtom.reportRead();
    return super._typeFilter;
  }

  @override
  set _typeFilter(String? value) {
    _$_typeFilterAtom.reportWrite(value, super._typeFilter, () {
      super._typeFilter = value;
    });
  }

  final _$_pokemonNameNumberFilterAtom =
      Atom(name: '_PokeApiStoreBase._pokemonNameNumberFilter');

  @override
  String? get _pokemonNameNumberFilter {
    _$_pokemonNameNumberFilterAtom.reportRead();
    return super._pokemonNameNumberFilter;
  }

  @override
  set _pokemonNameNumberFilter(String? value) {
    _$_pokemonNameNumberFilterAtom
        .reportWrite(value, super._pokemonNameNumberFilter, () {
      super._pokemonNameNumberFilter = value;
    });
  }

  final _$setPokemonAsyncAction = AsyncAction('_PokeApiStoreBase.setPokemon');

  @override
  Future<void> setPokemon(int index) {
    return _$setPokemonAsyncAction.run(() => super.setPokemon(index));
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  void addFavoritePokemon(String number) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.addFavoritePokemon');
    try {
      return super.addFavoritePokemon(number);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFavoritePokemon(String number) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.removeFavoritePokemon');
    try {
      return super.removeFavoritePokemon(number);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addGenerationFilter(Generation generationFilter) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.addGenerationFilter');
    try {
      return super.addGenerationFilter(generationFilter);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearGenerationFilter() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.clearGenerationFilter');
    try {
      return super.clearGenerationFilter();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTypeFilter(String type) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.addTypeFilter');
    try {
      return super.addTypeFilter(type);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearTypeFilter() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.clearTypeFilter');
    try {
      return super.clearTypeFilter();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNameNumberFilter(String nameNumberFilter) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.setNameNumberFilter');
    try {
      return super.setNameNumberFilter(nameNumberFilter);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearNameNumberFilter() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.clearNameNumberFilter');
    try {
      return super.clearNameNumberFilter();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonSummary: ${pokemonSummary},
pokemon: ${pokemon},
pokemonsSummary: ${pokemonsSummary},
index: ${index},
generationFilter: ${generationFilter},
typeFilter: ${typeFilter},
pokemonNameNumberFilter: ${pokemonNameNumberFilter},
favoritesPokemonsSummary: ${favoritesPokemonsSummary}
    ''';
  }
}
