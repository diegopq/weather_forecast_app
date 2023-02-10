import 'package:weather_forecast/app/app.dart';
import 'package:weather_forecast/bootstrap.dart';
import 'package:weather_forecast/injection_container.dart';

void main() {
  setupLocator();
  bootstrap(() => const App());
}
