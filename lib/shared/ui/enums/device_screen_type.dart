import 'package:flutter/cupertino.dart';

enum DeviceScreenType { DESKTOP, TABLET, CELLPHONE }

DeviceScreenType getDeviceScreenType(BuildContext context) {
  final orientation = MediaQuery.of(context).orientation;
  final size = MediaQuery.of(context).size;

  if (Orientation.portrait == orientation) {
    if (size.width >= 900) {
      return DeviceScreenType.DESKTOP;
    } else if (size.width >= 600) {
      return DeviceScreenType.TABLET;
    } else {
      return DeviceScreenType.CELLPHONE;
    }
  } else {
    if (size.height >= 900) {
      return DeviceScreenType.DESKTOP;
    } else if (size.height >= 600) {
      return DeviceScreenType.TABLET;
    } else {
      return DeviceScreenType.CELLPHONE;
    }
  }
}
