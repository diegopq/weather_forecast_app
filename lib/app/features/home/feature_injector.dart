import 'package:weather_forecast/app/features/home/data/repositories/repositories_impl.dart';
import 'package:weather_forecast/app/features/home/domain/repositories/repositories.dart';
import 'package:weather_forecast/app/features/home/domain/usecases/use_cases.dart';
import 'package:weather_forecast/injection_container.dart';
import 'package:weather_forecast/app/features/home/data/datasources/datasources.dart';

void homeInjector() {
  //datasources
  getIt
    ..registerLazySingleton<IWeatherDataSource>(
      WeatherDatasource.new,
    )
    ..registerLazySingleton<IPlacesDatasource>(
      PlacesDatasource.new,
    )

    //repositories
    ..registerLazySingleton<IWeatherRepo>(
      () => WeatherRepoImpl(
        getIt<IWeatherDataSource>(),
      ),
    )
    ..registerLazySingleton<IPlacesRepo>(
      () => PlacesRepoImpl(
        getIt<IPlacesDatasource>(),
      ),
    )

    //use cases
    ..registerLazySingleton<GetWeather>(
      () => GetWeather(
        getIt<IWeatherRepo>(),
      ),
    )
    ..registerLazySingleton<SearchPlaces>(
      () => SearchPlaces(
        getIt<IPlacesRepo>(),
      ),
    );
}
