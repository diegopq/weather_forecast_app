part of 'widgets.dart';

class WeatherPlace extends StatelessWidget {
  const WeatherPlace({
    required this.place,
    required this.weather,
    super.key,
  });

  final Place place;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CurrentWeatherSection(
          place: place,
          currentWeather: weather.currentWeather,
        ),
        Expanded(
          child: DailyWeatherList(
            dailyWeather: weather.dailyWeather,
          ),
        )
      ],
    );
  }
}
