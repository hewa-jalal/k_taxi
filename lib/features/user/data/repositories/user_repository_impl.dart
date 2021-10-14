import 'package:k_taxi/core/errors/exceptions/exceptions.dart';
import 'package:k_taxi/features/user/data/datasources/user_remote_data_source.dart';
import 'package:k_taxi/features/user/data/models/user_model.dart';
import 'package:k_taxi/core/errors/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:k_taxi/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});
  @override
  Future<Either<Failure, UserModel>> getUserPosition() async {
    try {
      final user = await userRemoteDataSource.getUserPosition();
      return right(user);
    } on UserNotFoundException {
      return left(UserNotFoundFailure());
    }
  }
}
