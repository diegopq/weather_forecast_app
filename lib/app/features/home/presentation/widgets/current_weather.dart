part of 'widgets.dart';

class CurrentWeatherSection extends StatelessWidget {
  const CurrentWeatherSection({
    required this.place,
    required this.currentWeather,
    super.key,
  });

  final Place place;
  final CurrentWeather currentWeather;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 0.2.sh,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: FittedBox(
                      child: Text(
                        place.placeName,
                        style: theme.textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      place.country,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Text(
                        '${currentWeather.temperature.toStringAsFixed(1)}º',
                        style: theme.textTheme.displayLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 50.spMin,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  getWeatherAnimation(
                    currentWeather.weatherCode,
                  ), //AppAnimations.weatherMist,
                  height: 0.15.sh,
                ),
                // SizedBox(
                //   height: 5.h,
                // ),
                Text(
                  currentWeather.weatherDescription,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
