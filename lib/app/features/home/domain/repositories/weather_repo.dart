part of 'repositories.dart';

// ignore: one_member_abstracts
abstract class IWeatherRepo {
  Future<Either<Failure, Weather>> getLocationWeather({
    required double lat,
    required double lon,
  });
}
