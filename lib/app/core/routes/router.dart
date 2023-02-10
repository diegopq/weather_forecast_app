import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:go_router/go_router.dart';

import 'package:weather_forecast/app/features/home/home.dart';
import 'package:weather_forecast/app/core/routes/route_names.dart';

class AppRouter {
  AppRouter(
    // ignore: avoid_unused_constructor_parameters
    BuildContext context, {
    List<NavigatorObserver>? navigatorObservers,
  }) : _observers = navigatorObservers;

  final List<NavigatorObserver>? _observers;

  late final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: Routes.home.path,
    observers: _observers,
    routes: [
      //home
      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        builder: (_, state) => HomePage(
          key: state.pageKey,
        ),
      ),
    ],
  );
}
