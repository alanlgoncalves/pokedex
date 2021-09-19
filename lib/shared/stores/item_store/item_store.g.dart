// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemStore on _ItemStoreBase, Store {
  Computed<String?>? _$filterComputed;

  @override
  String? get filter => (_$filterComputed ??=
          Computed<String?>(() => super.filter, name: '_ItemStoreBase.filter'))
      .value;
  Computed<List<Item>>? _$itemsComputed;

  @override
  List<Item> get items => (_$itemsComputed ??=
          Computed<List<Item>>(() => super.items, name: '_ItemStoreBase.items'))
      .value;

  final _$_itemsAtom = Atom(name: '_ItemStoreBase._items');

  @override
  List<Item> get _items {
    _$_itemsAtom.reportRead();
    return super._items;
  }

  @override
  set _items(List<Item> value) {
    _$_itemsAtom.reportWrite(value, super._items, () {
      super._items = value;
    });
  }

  final _$_filterAtom = Atom(name: '_ItemStoreBase._filter');

  @override
  String? get _filter {
    _$_filterAtom.reportRead();
    return super._filter;
  }

  @override
  set _filter(String? value) {
    _$_filterAtom.reportWrite(value, super._filter, () {
      super._filter = value;
    });
  }

  final _$fetchItemsAsyncAction = AsyncAction('_ItemStoreBase.fetchItems');

  @override
  Future<void> fetchItems() {
    return _$fetchItemsAsyncAction.run(() => super.fetchItems());
  }

  final _$_ItemStoreBaseActionController =
      ActionController(name: '_ItemStoreBase');

  @override
  void setFilter(String filter) {
    final _$actionInfo = _$_ItemStoreBaseActionController.startAction(
        name: '_ItemStoreBase.setFilter');
    try {
      return super.setFilter(filter);
    } finally {
      _$_ItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilter() {
    final _$actionInfo = _$_ItemStoreBaseActionController.startAction(
        name: '_ItemStoreBase.clearFilter');
    try {
      return super.clearFilter();
    } finally {
      _$_ItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filter: ${filter},
items: ${items}
    ''';
  }
}
