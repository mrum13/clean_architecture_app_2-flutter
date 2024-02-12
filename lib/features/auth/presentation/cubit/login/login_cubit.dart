import 'package:clean_architecture_app_2/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._useCase) : super(LoginInitial());

  final LoginUseCase _useCase;

  void login({required String username, required String pass}) async {
    ///emit login loading  
    emit(LoginLoading());

    ///proses ke usecase login user
    final result = await _useCase(user: username, pass: pass);

    ///emit login user sukses  
    result.fold(
      (failure) => emit(LoginFailed(failure.message)),
      (data) => emit(LoginSucces(data)),
    );
  }
}
