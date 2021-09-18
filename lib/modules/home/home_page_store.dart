import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

class HomePageStore = _PokemonGridStoreBase with _$HomePageStore;

enum PanelType {
  FILTER_POKEMON_GENERATION,
  FILTER_POKEMON_TYPE,
  FILTER_POKEMON_NAME_NUMBER,
  FILTER_ITEMS,
  FAVORITES_POKEMONS
}

extension PanelTypeExtension on PanelType {
  bool get isTextFilter {
    return this == PanelType.FILTER_POKEMON_NAME_NUMBER ||
        this == PanelType.FILTER_ITEMS;
  }
}

enum HomePageType { POKEMON_GRID, ITENS }

extension HomePageTypeExtension on HomePageType {
  String get description {
    switch (this) {
      case HomePageType.POKEMON_GRID:
        return "Pokemons";
      case HomePageType.ITENS:
        return "Items";
      default:
        throw "Home Page Type not found";
    }
  }
}

abstract class _PokemonGridStoreBase with Store {
  @observable
  bool _isFilterOpen = false;

  @observable
  bool _isBackgroundBlack = false;

  @observable
  bool _isFabVisible = true;

  @observable
  PanelType? _panelType;

  @observable
  HomePageType _page = HomePageType.POKEMON_GRID;

  @computed
  bool get isFilterOpen => _isFilterOpen;

  @computed
  PanelType? get panelType => _panelType;

  @computed
  bool get isBackgroundBlack => _isBackgroundBlack;

  @computed
  bool get isFabVisible => _isFabVisible;

  @computed
  HomePageType get page => _page;

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

  @action
  void setPage(HomePageType page) {
    _page = page;
  }
}
