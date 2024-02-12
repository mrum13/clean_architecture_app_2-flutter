import 'package:clean_architecture_app_2/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> login({required String user, required String pass});
  // Future<Either<Failure, List<DestinationEntity>>> top();
  // Future<Either<Failure, List<DestinationEntity>>> search(String query);
}