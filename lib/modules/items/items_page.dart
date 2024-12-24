import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/shared/models/item.dart';
import 'package:pokedex/shared/stores/item_store/item_store.dart';
import 'package:pokedex/shared/utils/image_utils.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  static const _pageSize = 20;

  final ItemStore _itemStore = GetIt.instance<ItemStore>();

  final PagingController<int, Widget> _pagingController =
      PagingController(firstPageKey: 0);

  late ReactionDisposer filterReactionDisposer;

  @override
  void initState() {
    _fetchItems();

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    filterReactionDisposer = reaction((_) => _itemStore.filter, (_) {
      _pagingController.refresh();
    });

    super.initState();
  }

  Future<void> _fetchItems() async {
    await _itemStore.fetchItems();
  }

  double getItemsPagePadding(Size size) {
    double horizontalPadding = 0;

    if (size.width > 1200) {
      horizontalPadding = size.width * 0.15;
    } else {
      horizontalPadding = 10;
    }

    return horizontalPadding;
  }

  void _fetchPage(int pageKey) async {
    final maxRange = _itemStore.items.length;
    final initialRange = pageKey * _pageSize;
    final finalRange = (pageKey * _pageSize) + _pageSize > maxRange
        ? maxRange
        : (pageKey * _pageSize) + _pageSize;

    List<Widget> items = [];

    for (int index = initialRange; index < finalRange; index++) {
      final _item = _itemStore.items[index];

      items.add(await _buildItemWidget(item: _item));
    }

    if (maxRange == finalRange) {
      _pagingController.appendLastPage(items);
    } else {
      _pagingController.appendPage(items, pageKey + 1);
    }
  }

  Future<ListTile> _buildItemWidget({required Item item}) {
    return Future.delayed(Duration.zero, () {
      final TextTheme textTheme = Theme.of(context).textTheme;

      return ListTile(
        leading: item.imageUrl != null
            ? ImageUtils.networkImage(
                url: item.imageUrl!,
                height: 25,
                width: 25,
              )
            : Icon(
                Icons.image_not_supported,
                color: Colors.grey,
                size: 20,
              ),
        title: Text(
          item.name,
          style: textTheme.bodyLarge,
        ),
        trailing: Text(
          item.category,
          style: textTheme.bodyLarge,
        ),
        subtitle: item.effect.trim().length > 0
            ? Text(
                item.effect,
                style: textTheme.titleMedium,
              )
            : null,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Observer(builder: (_) {
      if (_itemStore.items.isEmpty) {
        return SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: getItemsPagePadding(size),
          ),
          sliver: PagedSliverList.separated(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Widget>(
              itemBuilder: (context, item, index) => item,
            ),
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
        );
      }
    });
  }
}
