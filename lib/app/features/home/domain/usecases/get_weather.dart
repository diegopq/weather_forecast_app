part of 'use_cases.dart';

class GetWeather {
  GetWeather(this._weatherRepo);

  final IWeatherRepo _weatherRepo;

  Future<Either<Failure, Weather>> call({
    required double lat,
    required double lon,
  }) async {
    return _weatherRepo.getLocationWeather(lat: lat, lon: lon);
  }
}
