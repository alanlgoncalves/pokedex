import 'package:flutter/material.dart';
import 'package:pokedex/shared/ui/widgets/pokemon_type_badge.dart';
import 'package:pokedex/theme/app_theme.dart';

class TypeEffectivenessWidget extends StatelessWidget {
  final String? type;
  final String? value;
  final bool? hasNone;

  const TypeEffectivenessWidget(
      {Key? key, this.type, this.value, this.hasNone = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Container(
          width: 50,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: hasNone!
                ? AppTheme.colors.unknownIcon
                : AppTheme.colors.pokemonItem(type!),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (!hasNone!)
                PokemonTypeBadge(
                  type: type!,
                  height: 20,
                  width: 20,
                  showText: false,
                  showBorder: false,
                ),
              if (!hasNone!)
                Container(
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white30,
                  ),
                  child: Text(
                    value!,
                    style: textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),
              if (hasNone!)
                Container(
                  width: 20,
                  child: Icon(
                    Icons.block,
                    color: Colors.red[400],
                  ),
                ),
            ],
          ),
        ),
        Text(
          hasNone! ? "NONE" : type!,
          style: textTheme.bodyText1?.copyWith(fontSize: 8),
        )
      ],
    );
  }
}
