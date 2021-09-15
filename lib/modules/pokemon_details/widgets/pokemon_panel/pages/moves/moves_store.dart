import 'package:mobx/mobx.dart';

part 'moves_store.g.dart';

class MovesStore = _MovesStoreBase with _$MovesStore;

abstract class _MovesStoreBase with Store {
  @observable
  ObservableList<bool> _panels = ObservableList<bool>();

  _MovesStoreBase() {
    _panels.addAll([true, false, false, false, false, false]);
  }

  @computed
  List<bool> get panels => _panels.toList();

  @action
  void setOpen(int index) {
    _panels[index] = !_panels[index];
  }
}
