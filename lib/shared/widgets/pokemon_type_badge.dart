import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonTypeBadge extends StatelessWidget {
  final String type;
  final double height;
  final double width;
  final bool? showText;
  final bool? showBorder;

  const PokemonTypeBadge({
    Key? key,
    required this.type,
    required this.height,
    required this.width,
    this.showText = true,
    this.showBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: height,
          width: width,
          child: SizedBox(
            child: SvgPicture.asset(
              AppConstants.pokemonTypeLogo(type),
            ),
          ),
          decoration: BoxDecoration(
            color: AppTheme.colors.pokemonItem(type),
            border: showBorder!
                ? Border.all(color: AppTheme.colors.pokemonTabTitle)
                : null,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        if (showText!)
          Container(
            width: 30,
            child: Text(
              type,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "CircularStd-Book",
                fontSize: 8,
                fontWeight: FontWeight.normal,
                color: Color(0xFF303943),
              ),
            ),
          )
      ],
    );
  }
}
