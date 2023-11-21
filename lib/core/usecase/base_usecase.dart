import 'package:dartz/dartz.dart';
import 'package:movies/core/network/failure.dart';

abstract class BaseUseCase <T , Parameter>{
  Future<Either<Failure, T>> call (Parameter parameter);
}