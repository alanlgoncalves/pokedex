import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/modules/pages/home/widgets/app_bar.dart';
import 'package:pokedex/modules/pages/home/widgets/poke_item.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/shared/utils/app_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarPadding = MediaQuery.of(context).padding.top;

    final pokeApiStore = PokeApiStore();

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -(249 / 3),
            top: -38,
            child: Opacity(
              opacity: 0.1,
              child: SvgPicture.asset(
                AppConstants.blackPokeballLogo,
                width: 249,
                height: 249,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: statusBarPadding,
              ),
              AppBarWidget(),
              Expanded(
                child: Container(
                  child: Observer(builder: (context) {
                    final pokeApi = pokeApiStore.pokeApi;

                    if (pokeApi != null) {
                      return Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: AnimationLimiter(
                          child: GridView.builder(
                            padding: const EdgeInsets.all(10.0),
                            physics: BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: (4 / 3),
                            ),
                            itemBuilder: (context, index) {
                              pokeApiStore.setIndex(index);

                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                columnCount: 2,
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Ink(
                                          child: PokeItemWidget(
                                        pokemon: pokeApiStore.pokemon,
                                        image: pokeApiStore.pokemonImage,
                                        index: index,
                                      )),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: pokeApi.pokemon!.length,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  }),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
