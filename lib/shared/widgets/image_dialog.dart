import 'package:flutter/material.dart';

class ImageDialogWidget extends StatelessWidget {
  final String imageUrl;

  const ImageDialogWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 430,
        width: 430,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
