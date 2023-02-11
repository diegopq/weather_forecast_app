part of 'datasources.dart';

// ignore: one_member_abstracts
abstract class IWeatherDataSource {
  ///Gets the weather for a specific location
  Future<WeatherModel> getLocationWeather({
    required String lat,
    required String lon,
  });
}

class WeatherDatasource extends IWeatherDataSource {
  WeatherDatasource() {
    _client = RestDioClient(EnvConfig.kWeatherApiUrl);
  }

  late final IBaseRestClient _client;

  @override
  Future<WeatherModel> getLocationWeather({
    required String lat,
    required String lon,
  }) async {
    final res = await _client.requestHttp<Map<String, dynamic>>(
      httpMethod: RequestType.get,
      endpointUrl: '/onecall',
      requestData: {
        'lat': lat,
        'lon': lon,
        'exclude': 'minutely,hourly,alerts',
        'units': 'metric',
        'lang': 'es',
        'appid': EnvConfig.kWeatherApiKey,
      },
    );
    return WeatherModel.fromJson(res);
  }
}
