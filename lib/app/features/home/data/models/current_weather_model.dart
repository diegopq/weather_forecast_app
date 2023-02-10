part of 'models.dart';

class CurrentWeatherModel extends CurrentWeather {
  CurrentWeatherModel({
    required super.date,
    required super.temperature,
    required super.thermalSensation,
    required super.pressure,
    required super.humidity,
    required super.uvIndex,
    required super.visibility,
    required super.windSpeed,
    required super.weatherCode,
    required super.weatherDescription,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] as int, isUtc: true),
      temperature: json['temp'] as num,
      thermalSensation: json['feels_like'] as num,
      pressure: json['pressure'] as num,
      humidity: json['humidity'] as num,
      uvIndex: json['uvi'] as num,
      visibility: json['visibility'] as num,
      windSpeed: json['wind_speed'] as num,
      weatherCode: (json['weather'] as List).first['id'] as int,
      weatherDescription:
          (json['weather'] as List).first['description'] as String,
    );
  }
}

extension CurrentWeatherMapper on CurrentWeatherModel {
  CurrentWeather toEntitie() {
    return CurrentWeather(
      date: date,
      temperature: temperature,
      thermalSensation: thermalSensation,
      pressure: pressure,
      humidity: humidity,
      uvIndex: uvIndex,
      visibility: visibility,
      windSpeed: windSpeed,
      weatherCode: weatherCode,
      weatherDescription: weatherDescription,
    );
  }
}
