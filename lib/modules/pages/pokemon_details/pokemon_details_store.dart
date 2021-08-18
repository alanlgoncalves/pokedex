import 'package:mobx/mobx.dart';
part 'pokemon_details_store.g.dart';

class PokemonDetailsStore = _PokemonDetailsStoreBase with _$PokemonDetailsStore;

abstract class _PokemonDetailsStoreBase with Store {
  @observable
  double _progress = 0;

  @observable
  double _opacityTitleAppbar = 0;

  @observable
  double _opacityPokemon = 1;

  @computed
  double get progress => _progress;

  @computed
  double get opacityTitleAppbar => _opacityTitleAppbar;

  @computed
  double get opacityPokemon => _opacityPokemon;

  @action
  void setProgress(double progress, double lower, double upper) {
    _progress = progress;
    _opacityTitleAppbar = _calcOpacityTitleAppbar(lower, upper);
    _opacityPokemon = _setOpacityPokemon(lower, upper);
  }

  double _calcOpacityTitleAppbar(double lower, double upper) {
    assert(lower < upper);

    return ((_progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }

  double _setOpacityPokemon(double lower, double upper) {
    assert(lower < upper);

    return 1 - ((_progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }
}
