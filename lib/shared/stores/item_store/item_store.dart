import 'package:mobx/mobx.dart';
import 'package:pokedex/shared/models/item.dart';
import 'package:pokedex/shared/repositories/item_repository.dart';

part 'item_store.g.dart';

class ItemStore = _ItemStoreBase with _$ItemStore;

abstract class _ItemStoreBase with Store {
  final ItemRepository _itemRepository = ItemRepository();

  _ItemStoreBase() {
    this.fetchItems();
  }

  @observable
  List<Item> _items = [];

  @observable
  String? _filter;

  @observable
  ObservableList<bool> _panels = ObservableList<bool>();

  @computed
  String? get filter => _filter;

  @computed
  List<Item> get items {
    if (_filter != null) {
      return _items
          .where((it) => it.name.toLowerCase().contains(_filter!.toLowerCase()))
          .toList();
    }

    return _items;
  }

  @action
  void setFilter(String filter) {
    this._filter = filter;
  }

  @action
  void clearFilter() {
    this._filter = null;
  }

  void fetchItems() async {
    _items = await _itemRepository.fetchItems();
  }
}
