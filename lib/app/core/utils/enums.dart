part of 'utils.dart';

///indicates the flavor in which the application is running
enum Flavor { development, staging, production }

///http client exceptions
enum BaseClientExceptionType { unknown, network, server, other, auth, client }

///type of http request
enum RequestType { get, post, put, patch }

///Type of place
enum PlaceType { city, terminal, airport, none }
