///Exposes the route names and paths used in the application
class Routes {
  ///home route data with the name of `home` and path of `/`
  static final RouteData home = RouteData(name: 'home', path: '/');
}

class RouteData {
  ///Data of the route
  RouteData({required this.name, required this.path});

  final String name;
  final String path;
}
