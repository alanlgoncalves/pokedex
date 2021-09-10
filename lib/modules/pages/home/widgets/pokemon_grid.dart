import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/modules/pages/home/widgets/poke_item.dart';
import 'package:pokedex/modules/pages/pokemon_details/pokemon_details.dart';
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

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  void _fetchPage(int pageKey) async {
    final maxRange = widget.pokeApiStore.pokemonsSummary!.length;
    final initialRange = pageKey * _pageSize;
    final finalRange = (pageKey * _pageSize) + _pageSize > maxRange
        ? maxRange
        : (pageKey * _pageSize) + _pageSize;

    List<Widget> items = [];

    for (int i = initialRange; i < finalRange; i++) {
      items.add(_buildPokemonItem(i));
    }

    if (maxRange == finalRange) {
      _pagingController.appendLastPage(items);
    } else {
      _pagingController.appendPage(items, pageKey + 1);
    }
  }

  Widget _buildPokemonItem(int index) {
    final _pokemon = widget.pokeApiStore.getPokemon(index);

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
          pokemon: _pokemon,
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
