import 'package:movies/core/network/error_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel ;

  ServerException({ required this.errorMessageModel});

  List<Object?> get props => [errorMessageModel];
}