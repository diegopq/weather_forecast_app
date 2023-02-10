part of 'global_widgets.dart';

class FlavorBanner extends StatelessWidget {
  ///Shows a banner in the indicated position depending on the flavor in which
  ///the application is running [development, staging, production]
  ///[child] is the material app widget or any other widget
  ///[flavor] is the flavor in which the application is running
  ///[position] is the position in which the banner will be shown, by default is
  ///`BannerLocation.topEnd`
  ///[devColor] is the color of the banner in the development flavor
  ///[stgColor] is the color of the banner in the staging flavor
  ///
  ///`Example:`
  ///```dart
  /// FlavorBanner(
  ///  flavor: Flavor.development,
  ///  position: BannerLocation.topEnd,
  ///  devColor: Colors.red,
  ///  stgColor: Colors.blue,
  ///  child: MaterialApp(),
  /// );
  ///```
  const FlavorBanner({
    required this.child,
    required this.flavor,
    this.position = BannerLocation.topEnd,
    this.devColor = Colors.amber,
    this.stgColor = Colors.cyan,
    super.key,
  });

  final Flavor flavor;
  final BannerLocation position;
  final Color devColor;
  final Color stgColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return flavor == Flavor.production
        ? child
        : Banner(
            message: flavor == Flavor.development
                ? 'DEV'
                : flavor == Flavor.staging
                    ? 'STG'
                    : '',
            location: position,
            color: flavor == Flavor.development
                ? devColor
                : flavor == Flavor.staging
                    ? stgColor
                    : Colors.transparent,
            textDirection: TextDirection.ltr,
            layoutDirection: TextDirection.ltr,
            child: child,
          );
  }
}
