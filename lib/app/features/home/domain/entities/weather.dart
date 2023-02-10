part of 'entities.dart';

class Weather {
  Weather({
    required this.lat,
    required this.lon,
    required this.currentWeather,
    required this.dailyWeather,
  });

  final double lat;
  final double lon;
  final CurrentWeather currentWeather;
  final List<DayWeather> dailyWeather;
}
