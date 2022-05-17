// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on _PokemonGridStoreBase, Store {
  Computed<bool>? _$isFilterOpenComputed;

  @override
  bool get isFilterOpen =>
      (_$isFilterOpenComputed ??= Computed<bool>(() => super.isFilterOpen,
              name: '_PokemonGridStoreBase.isFilterOpen'))
          .value;
  Computed<PanelType?>? _$panelTypeComputed;

  @override
  PanelType? get panelType =>
      (_$panelTypeComputed ??= Computed<PanelType?>(() => super.panelType,
              name: '_PokemonGridStoreBase.panelType'))
          .value;
  Computed<bool>? _$isBackgroundBlackComputed;

  @override
  bool get isBackgroundBlack => (_$isBackgroundBlackComputed ??= Computed<bool>(
          () => super.isBackgroundBlack,
          name: '_PokemonGridStoreBase.isBackgroundBlack'))
      .value;
  Computed<bool>? _$isFabVisibleComputed;

  @override
  bool get isFabVisible =>
      (_$isFabVisibleComputed ??= Computed<bool>(() => super.isFabVisible,
              name: '_PokemonGridStoreBase.isFabVisible'))
          .value;
  Computed<HomePageType>? _$pageComputed;

  @override
  HomePageType get page =>
      (_$pageComputed ??= Computed<HomePageType>(() => super.page,
              name: '_PokemonGridStoreBase.page'))
          .value;

  late final _$_isFilterOpenAtom =
      Atom(name: '_PokemonGridStoreBase._isFilterOpen', context: context);

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

  late final _$_isBackgroundBlackAtom =
      Atom(name: '_PokemonGridStoreBase._isBackgroundBlack', context: context);

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

  late final _$_isFabVisibleAtom =
      Atom(name: '_PokemonGridStoreBase._isFabVisible', context: context);

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

  late final _$_panelTypeAtom =
      Atom(name: '_PokemonGridStoreBase._panelType', context: context);

  @override
  PanelType? get _panelType {
    _$_panelTypeAtom.reportRead();
    return super._panelType;
  }

  @override
  set _panelType(PanelType? value) {
    _$_panelTypeAtom.reportWrite(value, super._panelType, () {
      super._panelType = value;
    });
  }

  late final _$_pageAtom =
      Atom(name: '_PokemonGridStoreBase._page', context: context);

  @override
  HomePageType get _page {
    _$_pageAtom.reportRead();
    return super._page;
  }

  @override
  set _page(HomePageType value) {
    _$_pageAtom.reportWrite(value, super._page, () {
      super._page = value;
    });
  }

  late final _$_PokemonGridStoreBaseActionController =
      ActionController(name: '_PokemonGridStoreBase', context: context);

  @override
  void openFilter() {
    final _$actionInfo = _$_PokemonGridStoreBaseActionController.startAction(
        name: '_PokemonGridStoreBase.openFilter');
    try {
      return super.openFilter();
    } finally {
      _$_PokemonGridStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void closeFilter() {
    final _$actionInfo = _$_PokemonGridStoreBaseActionController.startAction(
        name: '_PokemonGridStoreBase.closeFilter');
    try {
      return super.closeFilter();
    } finally {
      _$_PokemonGridStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showBackgroundBlack() {
    final _$actionInfo = _$_PokemonGridStoreBaseActionController.startAction(
        name: '_PokemonGridStoreBase.showBackgroundBlack');
    try {
      return super.showBackgroundBlack();
    } finally {
      _$_PokemonGridStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideBackgroundBlack() {
    final _$actionInfo = _$_PokemonGridStoreBaseActionController.startAction(
        name: '_PokemonGridStoreBase.hideBackgroundBlack');
    try {
      return super.hideBackgroundBlack();
    } finally {
      _$_PokemonGridStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showFloatActionButton() {
    final _$actionInfo = _$_PokemonGridStoreBaseActionController.startAction(
        name: '_PokemonGridStoreBase.showFloatActionButton');
    try {
      return super.showFloatActionButton();
    } finally {
      _$_PokemonGridStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideFloatActionButton() {
    final _$actionInfo = _$_PokemonGridStoreBaseActionController.startAction(
        name: '_PokemonGridStoreBase.hideFloatActionButton');
    try {
      return super.hideFloatActionButton();
    } finally {
      _$_PokemonGridStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPanelType(PanelType panelType) {
    final _$actionInfo = _$_PokemonGridStoreBaseActionController.startAction(
        name: '_PokemonGridStoreBase.setPanelType');
    try {
      return super.setPanelType(panelType);
    } finally {
      _$_PokemonGridStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPage(HomePageType page) {
    final _$actionInfo = _$_PokemonGridStoreBaseActionController.startAction(
        name: '_PokemonGridStoreBase.setPage');
    try {
      return super.setPage(page);
    } finally {
      _$_PokemonGridStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFilterOpen: ${isFilterOpen},
panelType: ${panelType},
isBackgroundBlack: ${isBackgroundBlack},
isFabVisible: ${isFabVisible},
page: ${page}
    ''';
  }
}
