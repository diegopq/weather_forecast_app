part of 'use_cases.dart';

class GetWeather {
  GetWeather(this._weatherRepo);

  final IWeatherRepo _weatherRepo;

  Future<Either<Failure, Weather>> call({
    required String lat,
    required String lon,
  }) async {
    return _weatherRepo.getLocationWeather(lat: lat, lon: lon);
  }
}
