part of 'entities.dart';

class CurrentWeather {
  CurrentWeather({
    required this.date,
    required this.temperature,
    required this.thermalSensation,
    required this.pressure,
    required this.humidity,
    required this.uvIndex,
    required this.visibility,
    required this.windSpeed,
    required this.weatherCode,
    required this.weatherDescription,
  });

  final DateTime date;
  final num temperature;
  final num thermalSensation;
  final num pressure;
  final num humidity;
  final num uvIndex;
  final num visibility;
  final num windSpeed;
  final int weatherCode;
  final String weatherDescription;
}
