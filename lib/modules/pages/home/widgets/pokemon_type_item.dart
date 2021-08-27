import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonTypeItemWidget extends StatelessWidget {
  final String type;
  final Color? color;
  final VoidCallback onClick;

  const PokemonTypeItemWidget(
      {Key? key,
      required this.type,
      required this.onClick,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      enableFeedback: true,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          border: Border.fromBorderSide(
            BorderSide(color: AppTheme.colors.tabDivisor),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.08),
              blurRadius: 4.0,
              spreadRadius: 3.0,
              offset: Offset(
                0.0,
                4.0,
              ),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -15,
              right: -15,
              child: Container(
                child: Opacity(
                  opacity: 0.3,
                  child: SvgPicture.asset(
                    AppConstants.whitePokeballLogo,
                    color: Color(0xFFFFFFFF).withOpacity(0.4),
                    height: 83,
                    width: 83,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      type,
                      style: AppTheme.texts.pokemonTabTitle,
                    ),
                    SvgPicture.asset(
                      AppConstants.pokemonTypeLogo(type),
                      height: 80,
                      width: 80,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
