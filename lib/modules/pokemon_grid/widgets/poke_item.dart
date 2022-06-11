import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/shared/models/pokemon_summary.dart';
import 'package:pokedex/shared/ui/canvas/white_pokeball_canvas.dart';
import 'package:pokedex/shared/utils/image_utils.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokeItemWidget extends StatelessWidget {
  final PokemonSummary pokemon;
  final bool isFavorite;

  const PokeItemWidget(
      {Key? key, required this.pokemon, this.isFavorite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.colors.pokemonItem(pokemon.types[0]),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              bottom: -15,
              right: -3,
              child: Container(
                child: CustomPaint(
                  size: Size(
                      83,
                      (83 * 1.0040160642570282)
                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: PokeballLogoPainter(
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 7, bottom: 3),
                child: Container(
                  child: Hero(
                    tag: isFavorite
                        ? "favorite-pokemon-image-${pokemon.number}"
                        : "pokemon-image-${pokemon.number}",
                    child: ImageUtils.networkImage(
                      url: pokemon.thumbnailUrl,
                    ),
                  ),
                  height: 76,
                  width: 76,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8, top: 8),
                child: Text(
                  "#${pokemon.number}",
                  style: TextStyle(
                    fontFamily: "CircularStd-Book",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0x99FFFFFF),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: pokemon.types
                        .map((type) => Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: Text(
                                    type,
                                    style: textTheme.bodyText1?.copyWith(
                                      fontSize: 8,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(38),
                                    color: Colors.white.withOpacity(0.4)),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
