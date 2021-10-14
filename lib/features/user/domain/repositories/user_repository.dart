import 'package:dartz/dartz.dart';
import 'package:k_taxi/core/errors/failures/failures.dart';
import 'package:k_taxi/features/user/data/models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> getUserPosition();
}
