import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

enum PanelType {
  FILTER_POKEMON_GENERATION,
  FILTER_POKEMON_TYPE,
  FILTER_POKEMON_NAME_NUMBER
}

abstract class _HomeStoreBase with Store {
  @observable
  bool _isFilterOpen = false;

  @observable
  bool _isBackgroundBlack = false;

  @observable
  bool _isFabVisible = true;

  @observable
  PanelType? _panelType;

  @computed
  bool get isFilterOpen => _isFilterOpen;

  @computed
  PanelType? get panelType => _panelType;

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
    _panelType = null;
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

  @action
  void setPanelType(PanelType panelType) {
    _panelType = panelType;
  }
}
