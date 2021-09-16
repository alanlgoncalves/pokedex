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
  ObservableList<bool> _panels = ObservableList<bool>();

  @computed
  List<Item> get items => _items;

  void fetchItems() async {
    _items = await _itemRepository.fetchItems();
  }
}
