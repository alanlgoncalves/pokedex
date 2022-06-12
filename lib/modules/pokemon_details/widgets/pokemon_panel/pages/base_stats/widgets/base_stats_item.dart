import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class BaseStatsItemWidget extends StatelessWidget {
  final String title;
  final int maxValue;

  static final _pokemonStore = GetIt.instance<PokemonStore>();

  const BaseStatsItemWidget(
      {Key? key, required this.title, this.maxValue = 200})
      : super(key: key);

  double get barPercentage => value() / maxValue;

  int value() {
    switch (title.toUpperCase()) {
      case "HP":
        return _pokemonStore.pokemon!.baseStats.hp;
      case "ATTACK":
        return _pokemonStore.pokemon!.baseStats.attack;
      case "DEFENSE":
        return _pokemonStore.pokemon!.baseStats.defense;
      case "SP. ATK":
        return _pokemonStore.pokemon!.baseStats.spAtk;
      case "SP. DEF":
        return _pokemonStore.pokemon!.baseStats.spDef;
      case "SPEED":
        return _pokemonStore.pokemon!.baseStats.speed;
      case "TOTAL":
        return _pokemonStore.pokemon!.baseStats.total;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 87,
            child: Opacity(
              opacity: 0.4,
              child: Text(title, style: textTheme.bodyText1),
            ),
          ),
          Observer(
            builder: (_) => Container(
              width: 40,
              child: Text(
                value().toString(),
                style: textTheme.bodyText1,
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
                        color: AppTheme.getColors(context)
                            .baseStatsBar(barPercentage),
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
