part of 'entities.dart';

class Weather {
  Weather({
    required this.lat,
    required this.lon,
    required this.timeOffset,
    required this.timeZone,
    required this.currentWeather,
    required this.dailyWeather,
  });

  factory Weather.empty() {
    return Weather(
      lat: 0,
      lon: 0,
      timeOffset: 0,
      timeZone: '',
      currentWeather: CurrentWeather.empty(),
      dailyWeather: List.empty(),
    );
  }

  final double lat;
  final double lon;
  final num timeOffset;
  final String timeZone;
  final CurrentWeather currentWeather;
  final List<DayWeather> dailyWeather;
}
