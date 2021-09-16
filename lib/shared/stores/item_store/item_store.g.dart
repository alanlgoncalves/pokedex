// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemStore on _ItemStoreBase, Store {
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

  final _$_panelsAtom = Atom(name: '_ItemStoreBase._panels');

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

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
