import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokemonPanelWidget extends StatelessWidget {
  final void Function(SheetState) listener;

  const PokemonPanelWidget({Key? key, required this.listener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingSheet(
      listener: listener,
      elevation: 0,
      cornerRadius: 30,
      snapSpec: const SnapSpec(
        snap: true,
        snappings: [0.6, 1.0],
        positioning: SnapPositioning.relativeToSheetHeight,
      ),
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height,
        );
      },
    );
  }
}
