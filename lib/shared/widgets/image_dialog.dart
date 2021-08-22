import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageDialogWidget extends StatelessWidget {
  final String imageUrl;
  final String tag;

  const ImageDialogWidget({Key? key, required this.imageUrl, required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Hero(
          tag: tag,
          child: Container(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
