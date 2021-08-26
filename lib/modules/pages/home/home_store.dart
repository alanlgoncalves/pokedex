import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  bool _isFilterOpen = false;

  @observable
  bool _isBackgroundBlack = false;

  @observable
  bool _isFabVisible = true;

  @computed
  bool get isFilterOpen => _isFilterOpen;

  @computed
  bool get isBackgroundBlack => _isBackgroundBlack;

  @computed
  bool get isFabVisible => _isFabVisible;

  @action
  void openFilter() {
    _isFilterOpen = true;
  }

  @action
  void closeFilter() {
    _isFilterOpen = false;
  }

  @action
  void showBackgroundBlack() {
    _isBackgroundBlack = true;
  }

  @action
  void hideBackgroundBlack() {
    _isBackgroundBlack = false;
  }

  @action
  void showFloatActionButton() {
    _isFabVisible = true;
  }

  @action
  void hideFloatActionButton() {
    _isFabVisible = false;
  }
}
