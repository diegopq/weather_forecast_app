part of 'entities.dart';

class DayWeather {
  DayWeather({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.pressure,
    required this.humidity,
    required this.uvIndex,
    required this.windSpeed,
    required this.weatherCode,
    required this.weatherDescription,
  });

  final DateTime date;
  final num maxTemp;
  final num minTemp;
  final num pressure;
  final num humidity;
  final num uvIndex;
  final num windSpeed;
  final int weatherCode;
  final String weatherDescription;
}
