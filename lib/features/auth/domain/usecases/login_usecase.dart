import 'package:clean_architecture_app_2/core/error/failures.dart';
import 'package:clean_architecture_app_2/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final AuthRepository _status;

  LoginUseCase(this._status);

  Future<Either<Failure, bool>> call({required String user, required String pass}) {
    return _status.login(user: user, pass: pass);
  }
}