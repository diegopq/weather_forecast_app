part of 'utils.dart';

///indicates the flavor in which the application is running
enum Flavor { development, staging, production }

///http client exceptions
enum BaseClientExceptionType { unknown, network, server, other, auth, client }
