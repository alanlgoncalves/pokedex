// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<bool>? _$isFilterOpenComputed;

  @override
  bool get isFilterOpen =>
      (_$isFilterOpenComputed ??= Computed<bool>(() => super.isFilterOpen,
              name: '_HomeStoreBase.isFilterOpen'))
          .value;
  Computed<bool>? _$isBackgroundBlackComputed;

  @override
  bool get isBackgroundBlack => (_$isBackgroundBlackComputed ??= Computed<bool>(
          () => super.isBackgroundBlack,
          name: '_HomeStoreBase.isBackgroundBlack'))
      .value;
  Computed<bool>? _$isFabVisibleComputed;

  @override
  bool get isFabVisible =>
      (_$isFabVisibleComputed ??= Computed<bool>(() => super.isFabVisible,
              name: '_HomeStoreBase.isFabVisible'))
          .value;

  final _$_isFilterOpenAtom = Atom(name: '_HomeStoreBase._isFilterOpen');

  @override
  bool get _isFilterOpen {
    _$_isFilterOpenAtom.reportRead();
    return super._isFilterOpen;
  }

  @override
  set _isFilterOpen(bool value) {
    _$_isFilterOpenAtom.reportWrite(value, super._isFilterOpen, () {
      super._isFilterOpen = value;
    });
  }

  final _$_isBackgroundBlackAtom =
      Atom(name: '_HomeStoreBase._isBackgroundBlack');

  @override
  bool get _isBackgroundBlack {
    _$_isBackgroundBlackAtom.reportRead();
    return super._isBackgroundBlack;
  }

  @override
  set _isBackgroundBlack(bool value) {
    _$_isBackgroundBlackAtom.reportWrite(value, super._isBackgroundBlack, () {
      super._isBackgroundBlack = value;
    });
  }

  final _$_isFabVisibleAtom = Atom(name: '_HomeStoreBase._isFabVisible');

  @override
  bool get _isFabVisible {
    _$_isFabVisibleAtom.reportRead();
    return super._isFabVisible;
  }

  @override
  set _isFabVisible(bool value) {
    _$_isFabVisibleAtom.reportWrite(value, super._isFabVisible, () {
      super._isFabVisible = value;
    });
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void openFilter() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.openFilter');
    try {
      return super.openFilter();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void closeFilter() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.closeFilter');
    try {
      return super.closeFilter();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showBackgroundBlack() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.showBackgroundBlack');
    try {
      return super.showBackgroundBlack();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideBackgroundBlack() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.hideBackgroundBlack');
    try {
      return super.hideBackgroundBlack();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showFloatActionButton() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.showFloatActionButton');
    try {
      return super.showFloatActionButton();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideFloatActionButton() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.hideFloatActionButton');
    try {
      return super.hideFloatActionButton();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFilterOpen: ${isFilterOpen},
isBackgroundBlack: ${isBackgroundBlack},
isFabVisible: ${isFabVisible}
    ''';
  }
}
