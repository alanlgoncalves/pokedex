import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/shared/ui/enums/device_screen_type.dart';

class BuildContextMock extends Mock implements BuildContext {}

void main() {
  testWidgets("Should return CELLPHONE type for iPhone X on portrait mode",
      (WidgetTester tester) async {
    DeviceScreenType? screenType;

    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(size: Size(375, 812)),
        child: Builder(
          builder: (BuildContext context) {
            screenType = getDeviceScreenType(context);

            return Placeholder();
          },
        ),
      ),
    );

    expect(screenType, DeviceScreenType.CELLPHONE);
  });

  testWidgets("Should return CELLPHONE type for iPhone X on landscape mode",
      (WidgetTester tester) async {
    DeviceScreenType? screenType;

    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(size: Size(812, 375)),
        child: Builder(
          builder: (BuildContext context) {
            screenType = getDeviceScreenType(context);

            return Placeholder();
          },
        ),
      ),
    );

    expect(screenType, DeviceScreenType.CELLPHONE);
  });

  testWidgets("Should return TABLET type for iPad on portrait mode",
      (WidgetTester tester) async {
    DeviceScreenType? screenType;

    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(size: Size(768, 1024)),
        child: Builder(
          builder: (BuildContext context) {
            screenType = getDeviceScreenType(context);

            return Placeholder();
          },
        ),
      ),
    );

    expect(screenType, DeviceScreenType.TABLET);
  });

  testWidgets("Should return TABLET type for iPad on landscape mode",
      (WidgetTester tester) async {
    DeviceScreenType? screenType;

    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(size: Size(1024, 768)),
        child: Builder(
          builder: (BuildContext context) {
            screenType = getDeviceScreenType(context);

            return Placeholder();
          },
        ),
      ),
    );

    expect(screenType, DeviceScreenType.TABLET);
  });

  testWidgets("Should return DESKTOP type for MacbookPro on landscape mode",
      (WidgetTester tester) async {
    DeviceScreenType? screenType;

    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(size: Size(1440, 900)),
        child: Builder(
          builder: (BuildContext context) {
            screenType = getDeviceScreenType(context);

            return Placeholder();
          },
        ),
      ),
    );

    expect(screenType, DeviceScreenType.DESKTOP);
  });
}
