import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/modules/pages/home/widgets/poke_item.dart';
import 'package:pokedex/modules/pages/pokemon_details/pokemon_details.dart';
import 'package:pokedex/shared/models/pokemon_summary.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';

class PokemonGridWidget extends StatefulWidget {
  final PokeApiStore pokeApiStore;

  PokemonGridWidget({Key? key, required this.pokeApiStore}) : super(key: key);

  @override
  _PokemonGridWidgetState createState() => _PokemonGridWidgetState();
}

class _PokemonGridWidgetState extends State<PokemonGridWidget> {
  static const _pageSize = 20;

  final PagingController<int, Widget> _pagingController =
      PagingController(firstPageKey: 0);

  late ReactionDisposer filterReactionDisposer;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    filterReactionDisposer =
        reaction((_) => widget.pokeApiStore.pokemonFilter, (_) {
      _pagingController.refresh();
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    for (var pokemon in widget.pokeApiStore.pokemonsSummary!) {
      if (kIsWeb) {
        precacheImage(Image.network(pokemon.thumbnailUrl).image, context);
      }
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    filterReactionDisposer();

    super.dispose();
  }

  void _fetchPage(int pageKey) async {
    final maxRange = widget.pokeApiStore.pokemonsSummary!.length;
    final initialRange = pageKey * _pageSize;
    final finalRange = (pageKey * _pageSize) + _pageSize > maxRange
        ? maxRange
        : (pageKey * _pageSize) + _pageSize;

    List<Widget> items = [];

    for (int index = initialRange; index < finalRange; index++) {
      final _pokemon = widget.pokeApiStore.getPokemon(index);

      items.add(_buildPokemonItem(index: index, pokemon: _pokemon));

      _preCachePokemonImage(pokemon: _pokemon);
    }

    if (maxRange == finalRange) {
      _pagingController.appendLastPage(items);
    } else {
      _pagingController.appendPage(items, pageKey + 1);
    }
  }

  void _preCachePokemonImage({required PokemonSummary pokemon}) {
    if (kIsWeb) {
      precacheImage(Image.network(pokemon.thumbnailUrl).image, context);
    } else {
      precacheImage(CachedNetworkImageProvider(pokemon.thumbnailUrl), context);
    }
  }

  Widget _buildPokemonItem(
      {required int index, required PokemonSummary pokemon}) {
    return InkWell(
      onTap: () async {
        await widget.pokeApiStore.setPokemon(index);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) {
            return PokemonDetailsPage();
          }),
        );
      },
      child: Ink(
        child: PokeItemWidget(
          pokemon: pokemon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PagedSliverGrid<int, Widget>(
      showNewPageProgressIndicatorAsGridChild: false,
      showNewPageErrorIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      pagingController: _pagingController,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 3 / 2,
      ),
      builderDelegate: PagedChildBuilderDelegate<Widget>(
        itemBuilder: (context, item, index) => item,
      ),
    );
  }
}
