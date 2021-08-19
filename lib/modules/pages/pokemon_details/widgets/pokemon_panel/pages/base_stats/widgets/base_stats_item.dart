import 'package:flutter/material.dart';
import 'package:pokedex/theme/app_theme.dart';

class BaseStatsItemWidget extends StatelessWidget {
  final String title;
  final int value;
  final int maxValue;

  BaseStatsItemWidget(
      {Key? key, required this.title, required this.value, this.maxValue = 200})
      : super(key: key);

  double get barPercentage => value / maxValue;

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
          Container(
            width: 40,
            child: Text(
              value.toString(),
              style: AppTheme.texts.pokemonText,
            ),
          ),
          Flexible(
            flex: 1,
            child: Stack(
              children: [
                Expanded(
                  child: Container(
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F5F4),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    //color: Colors.red,
                  ),
                ),
                Expanded(
                  child: FractionallySizedBox(
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
