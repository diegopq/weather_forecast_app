part of 'models.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.lat,
    required super.lon,
    required super.currentWeather,
    required super.dailyWeather,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      lat: json['lat'] as double,
      lon: json['lon'] as double,
      currentWeather: CurrentWeatherModel.fromJson(
        json['current'] as Map<String, dynamic>,
      ),
      dailyWeather: (json['daily'] as List)
          .map(
            (e) => DayWeatherModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

extension WeatherMapper on WeatherModel {
  Weather toEntitie() {
    return Weather(
      lat: lat,
      lon: lon,
      currentWeather: currentWeather,
      dailyWeather: dailyWeather,
    );
  }
}
