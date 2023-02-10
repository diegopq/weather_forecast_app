part of 'utils.dart';

class EnvConfig {
  ///base url for open weather rest api
  static const String kWeatherApiUrl =
      String.fromEnvironment('WEATHER_API_URL');

  ///api key for open weather rest api
  static const String kWeatherApiKey =
      String.fromEnvironment('WEATHER_API_KEY');

  ///base url for reservamos rest api
  static const String kReservamosApiUrl =
      String.fromEnvironment('RESERVAMOS_API_URL');
}
