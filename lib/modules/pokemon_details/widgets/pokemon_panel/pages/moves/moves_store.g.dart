// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moves_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovesStore on _MovesStoreBase, Store {
  Computed<List<bool>>? _$panelsComputed;

  @override
  List<bool> get panels =>
      (_$panelsComputed ??= Computed<List<bool>>(() => super.panels,
              name: '_MovesStoreBase.panels'))
          .value;

  late final _$_panelsAtom =
      Atom(name: '_MovesStoreBase._panels', context: context);

  @override
  ObservableList<bool> get _panels {
    _$_panelsAtom.reportRead();
    return super._panels;
  }

  @override
  set _panels(ObservableList<bool> value) {
    _$_panelsAtom.reportWrite(value, super._panels, () {
      super._panels = value;
    });
  }

  late final _$_MovesStoreBaseActionController =
      ActionController(name: '_MovesStoreBase', context: context);

  @override
  void setOpen(int index) {
    final _$actionInfo = _$_MovesStoreBaseActionController.startAction(
        name: '_MovesStoreBase.setOpen');
    try {
      return super.setOpen(index);
    } finally {
      _$_MovesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
panels: ${panels}
    ''';
  }
}
