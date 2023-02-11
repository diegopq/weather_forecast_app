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

  factory CurrentWeather.empty() {
    return CurrentWeather(
      date: DateTime.now(),
      temperature: 0,
      thermalSensation: 0,
      pressure: 0,
      humidity: 0,
      uvIndex: 0,
      visibility: 0,
      windSpeed: 0,
      weatherCode: 0,
      weatherDescription: '',
    );
  }

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
