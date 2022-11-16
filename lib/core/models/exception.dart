import '../constants/error_message.dart';

class CustomException implements Exception {
  const CustomException({
    required this.info,
  });
  final String info;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomException && other.info == info;
  }

  @override
  int get hashCode => info.hashCode;

  @override
  String toString() => info;
}

class ServerException extends CustomException {
  const ServerException({required super.info});
}

class UnknownException extends CustomException {
  const UnknownException({required super.info});
}

class NoInternetConnectionException extends CustomException {
  const NoInternetConnectionException({
    super.info = ErrorMessage.noInternetConnection,
  });
}
