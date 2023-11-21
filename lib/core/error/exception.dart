import 'package:movies/core/network/error_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel ;

  ServerException({ required this.errorMessageModel});

  List<Object?> get props => [errorMessageModel];
}

class AuthException implements Exception {
  final String message ;

  AuthException({required this.message});

  List<Object?> get props => [message];
}