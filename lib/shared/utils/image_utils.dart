import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageUtils {
  static Widget networkImage(
      {required String url, double? height, double? width, Color? color}) {
    if (kIsWeb) {
      return Image.network(
        url,
        height: height,
        width: width,
        color: color,
      );
    }

    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      color: color,
    );
  }
}
