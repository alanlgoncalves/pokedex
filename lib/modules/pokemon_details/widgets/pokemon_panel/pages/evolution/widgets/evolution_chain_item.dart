import 'package:flutter/material.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/ui/canvas/white_pokeball_canvas.dart';
import 'package:pokedex/shared/ui/widgets/image_dialog.dart';
import 'package:pokedex/shared/utils/hero_dialog_route.dart';
import 'package:pokedex/shared/utils/image_utils.dart';
import 'package:pokedex/theme/app_theme.dart';

class EvolutionChainItemWidget extends StatelessWidget {
  final EvolutionChain previousEvolution;
  final EvolutionChain nextEvolution;

  const EvolutionChainItemWidget(
      {Key? key, required this.previousEvolution, required this.nextEvolution})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 83,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      new HeroDialogRoute(
                        builder: (BuildContext context) {
                          return ImageDialogWidget(
                              tag:
                                  "prev-${previousEvolution.number}-${previousEvolution.name}",
                              imageUrl: previousEvolution.imageUrl);
                        },
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 83,
                        width: 83,
                        child: CustomPaint(
                          size: Size(83, (83 * 1.0040160642570282).toDouble()),
                          painter: PokeballLogoPainter(
                            color: AppTheme.colors.pokeballLogoGray
                                .withOpacity(0.2),
                          ),
                        ),
                      ),
                      Container(
                        height: 83,
                        width: 83,
                        child: Center(
                          child: Hero(
                            tag:
                                "prev-${previousEvolution.number}-${previousEvolution.name}",
                            child: ImageUtils.networkImage(
                              url: previousEvolution.thumbUrl,
                              width: 76,
                              height: 71,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  previousEvolution.name,
                  style: textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "#${previousEvolution.number}",
                  style: textTheme.bodyText1?.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Icon(
                Icons.arrow_forward,
              ),
              Container(
                width: 100,
                child: Text(
                  nextEvolution.requirement!,
                  style: textTheme.bodyText1?.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Container(
            width: 83,
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      new HeroDialogRoute(
                        builder: (BuildContext context) {
                          return ImageDialogWidget(
                              tag:
                                  "next-${nextEvolution.number}-${nextEvolution.name}",
                              imageUrl: nextEvolution.imageUrl);
                        },
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 83,
                        width: 83,
                        child: CustomPaint(
                          size: Size(83, (83 * 1.0040160642570282).toDouble()),
                          painter: PokeballLogoPainter(
                            color: AppTheme.colors.pokeballLogoGray
                                .withOpacity(0.2),
                          ),
                        ),
                      ),
                      Container(
                        height: 83,
                        width: 83,
                        child: Center(
                          child: Hero(
                            tag:
                                "next-${nextEvolution.number}-${nextEvolution.name}",
                            child: ImageUtils.networkImage(
                              url: nextEvolution.thumbUrl,
                              width: 76,
                              height: 71,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  nextEvolution.name,
                  style: textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "#${nextEvolution.number}",
                  style: textTheme.bodyText1?.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
