part of 'widgets.dart';

class StartSearchLocation extends StatelessWidget {
  const StartSearchLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
          ),
          Lottie.asset(
            AppAnimations.selectLocation,
            height: 0.30.sh,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            l10n.typeNameOfCityToSeeTheWeather,
            style: theme.textTheme.titleSmall!.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
