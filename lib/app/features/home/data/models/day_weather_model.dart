part of 'models.dart';

class DayWeatherModel extends DayWeather {
  DayWeatherModel({
    required super.date,
    required super.maxTemp,
    required super.minTemp,
    required super.pressure,
    required super.humidity,
    required super.uvIndex,
    required super.windSpeed,
    required super.weatherCode,
    required super.weatherDescription,
  });

  factory DayWeatherModel.fromJson(Map<String, dynamic> json) {
    return DayWeatherModel(
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] as int, isUtc: true),
      maxTemp: json['temp']['max'] as num,
      minTemp: json['temp']['min'] as num,
      pressure: json['pressure'] as num,
      humidity: json['humidity'] as num,
      uvIndex: json['uvi'] as num,
      windSpeed: json['wind_speed'] as num,
      weatherCode: (json['weather'] as List).first['id'] as int,
      weatherDescription:
          (json['weather'] as List).first['description'] as String,
    );
  }
}

extension DayWeatherMapper on DayWeatherModel {
  DayWeather toEntitie() {
    return DayWeather(
      date: date,
      maxTemp: maxTemp,
      minTemp: minTemp,
      pressure: pressure,
      humidity: humidity,
      uvIndex: uvIndex,
      windSpeed: windSpeed,
      weatherCode: weatherCode,
      weatherDescription: weatherDescription,
    );
  }
}
