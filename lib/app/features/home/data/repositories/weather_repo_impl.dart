part of 'repositories_impl.dart';

class WeatherRepoImpl implements IWeatherRepo {
  WeatherRepoImpl(this._weatherDataSource);

  final IWeatherDataSource _weatherDataSource;

  @override
  Future<Either<Failure, Weather>> getLocationWeather({
    required String lat,
    required String lon,
  }) async {
    try {
      final result = await _weatherDataSource.getLocationWeather(
        lat: lat,
        lon: lon,
      );
      return Right(result.toEntitie());
    } on BaseClientException catch (e, stack) {
      log(e.toString(), stackTrace: stack, name: 'Weather Repo');
      if (e.type == BaseClientExceptionType.network) {
        return const Left(NetworkFailure());
      }
      if (e.type == BaseClientExceptionType.auth) {
        return const Left(AuthFailure());
      }
      if (e.type == BaseClientExceptionType.server) {
        return const Left(
          ServerFailure(),
        );
      }
      if (e.type == BaseClientExceptionType.unknown) {
        return const Left(AnotherFailure());
      }
      return const Left(AnotherFailure());
    } on BaseClientBadRequestException catch (e, stack) {
      log(e.toString(), stackTrace: stack, name: 'Weather Repo');
      return Left(
        ServiceFailure(e.code),
      );
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack, name: 'Weather Repo');
      return const Left(AnotherFailure());
    }
  }
}
