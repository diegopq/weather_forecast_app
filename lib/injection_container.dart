import 'package:get_it/get_it.dart';
import 'package:weather_forecast/app/features/home/home.dart';

///Allows dependency injection for the entire application
final getIt = GetIt.instance;

void setupLocator() {
  //!Features
  homeInjector();

  //!Core
  //datasources

  //repositories

  //use cases

  //!External
  //services
}
