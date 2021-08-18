// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonDetailsStore on _PokemonDetailsStoreBase, Store {
  Computed<double>? _$progressComputed;

  @override
  double get progress =>
      (_$progressComputed ??= Computed<double>(() => super.progress,
              name: '_PokemonDetailsStoreBase.progress'))
          .value;
  Computed<double>? _$opacityTitleAppbarComputed;

  @override
  double get opacityTitleAppbar => (_$opacityTitleAppbarComputed ??=
          Computed<double>(() => super.opacityTitleAppbar,
              name: '_PokemonDetailsStoreBase.opacityTitleAppbar'))
      .value;
  Computed<double>? _$opacityPokemonComputed;

  @override
  double get opacityPokemon =>
      (_$opacityPokemonComputed ??= Computed<double>(() => super.opacityPokemon,
              name: '_PokemonDetailsStoreBase.opacityPokemon'))
          .value;

  final _$_progressAtom = Atom(name: '_PokemonDetailsStoreBase._progress');

  @override
  double get _progress {
    _$_progressAtom.reportRead();
    return super._progress;
  }

  @override
  set _progress(double value) {
    _$_progressAtom.reportWrite(value, super._progress, () {
      super._progress = value;
    });
  }

  final _$_opacityTitleAppbarAtom =
      Atom(name: '_PokemonDetailsStoreBase._opacityTitleAppbar');

  @override
  double get _opacityTitleAppbar {
    _$_opacityTitleAppbarAtom.reportRead();
    return super._opacityTitleAppbar;
  }

  @override
  set _opacityTitleAppbar(double value) {
    _$_opacityTitleAppbarAtom.reportWrite(value, super._opacityTitleAppbar, () {
      super._opacityTitleAppbar = value;
    });
  }

  final _$_opacityPokemonAtom =
      Atom(name: '_PokemonDetailsStoreBase._opacityPokemon');

  @override
  double get _opacityPokemon {
    _$_opacityPokemonAtom.reportRead();
    return super._opacityPokemon;
  }

  @override
  set _opacityPokemon(double value) {
    _$_opacityPokemonAtom.reportWrite(value, super._opacityPokemon, () {
      super._opacityPokemon = value;
    });
  }

  final _$_PokemonDetailsStoreBaseActionController =
      ActionController(name: '_PokemonDetailsStoreBase');

  @override
  void setProgress(double progress, double lower, double upper) {
    final _$actionInfo = _$_PokemonDetailsStoreBaseActionController.startAction(
        name: '_PokemonDetailsStoreBase.setProgress');
    try {
      return super.setProgress(progress, lower, upper);
    } finally {
      _$_PokemonDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
progress: ${progress},
opacityTitleAppbar: ${opacityTitleAppbar},
opacityPokemon: ${opacityPokemon}
    ''';
  }
}
