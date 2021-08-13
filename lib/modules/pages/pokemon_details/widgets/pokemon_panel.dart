import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokemonPanelWidget extends StatelessWidget {
  const PokemonPanelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingSheet(
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
