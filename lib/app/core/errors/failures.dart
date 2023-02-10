part of 'errors.dart';

///Abstract class to define a failure, if the
///subclasses have some properties, they`ll get passed to this
///constructor so that Equatable can perform value comparison
abstract class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  ///When the response status is 500
  const ServerFailure() : super('failure.server');
}

class NetworkFailure extends Failure {
  ///When the app can't connect to the server
  const NetworkFailure() : super('failure.network');
}

class AuthFailure extends Failure {
  ///When during authentication the response has status 400
  const AuthFailure() : super('failure.auth');
}

class ServiceFailure extends Failure {
  const ServiceFailure(super.message);
}

class AnotherFailure extends Failure {
  ///When an unknown exception occurs
  const AnotherFailure() : super('failure.unknown');
}

class BadRequestFailure extends Failure {
  const BadRequestFailure(super.message);
}
