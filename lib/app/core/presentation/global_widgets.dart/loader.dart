part of 'global_widgets.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.size,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AppAnimations.loader,
        height: size ?? 30.r,
        width: size ?? 30.r,
      ),
    );
  }
}
