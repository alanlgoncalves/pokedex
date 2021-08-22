import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class BaseStatsItemWidget extends StatelessWidget {
  final String title;
  final int maxValue;

  static final _pokeApiStore = GetIt.instance<PokeApiStore>();

  const BaseStatsItemWidget(
      {Key? key, required this.title, this.maxValue = 200})
      : super(key: key);

  double get barPercentage => value() / maxValue;

  int value() {
    switch (title.toUpperCase()) {
      case "HP":
        return _pokeApiStore.pokemon!.baseStats.hp;
      case "ATTACK":
        return _pokeApiStore.pokemon!.baseStats.attack;
      case "DEFENSE":
        return _pokeApiStore.pokemon!.baseStats.defense;
      case "SP. ATK":
        return _pokeApiStore.pokemon!.baseStats.spAtk;
      case "SP. DEF":
        return _pokeApiStore.pokemon!.baseStats.spDef;
      case "SPEED":
        return _pokeApiStore.pokemon!.baseStats.speed;
      case "TOTAL":
        return _pokeApiStore.pokemon!.baseStats.total;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 87,
            child: Text(
              title,
              style: AppTheme.texts.pokemonTabViewSubTitle,
            ),
          ),
          Observer(
            builder: (_) => Container(
              width: 40,
              child: Text(
                value().toString(),
                style: AppTheme.texts.pokemonText,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F5F4),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  //color: Colors.red,
                ),
                Observer(
                  builder: (_) => FractionallySizedBox(
                    widthFactor: barPercentage,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 3),
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppTheme.colors.baseStatsBar(barPercentage),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
