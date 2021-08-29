import 'package:flutter/cupertino.dart';
import 'package:pokedex/shared/ui/enums/device_screen_type.dart';

class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceScreenType;
  final Size screenSize;

  SizingInformation({
    required this.orientation,
    required this.deviceScreenType,
    required this.screenSize,
  });
}
