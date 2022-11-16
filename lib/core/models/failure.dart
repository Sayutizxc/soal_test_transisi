import '../constants/error_message.dart';

abstract class Failure {
  final String info;
  Failure({
    required this.info,
  });

  @override
  String toString() => info;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure && other.info == info;
  }

  @override
  int get hashCode => info.hashCode;
}

class LoginFailure extends Failure {
  LoginFailure({required super.info});
}

class NoInternetConnectionFailure extends Failure {
  NoInternetConnectionFailure({super.info = ErrorMessage.noInternetConnection});
}

class ServerFailure extends Failure {
  ServerFailure({required super.info});
}

class UnknownFailure extends Failure {
  UnknownFailure({required super.info});
}

class GeneralFailure extends Failure {
  GeneralFailure({required super.info});
}
