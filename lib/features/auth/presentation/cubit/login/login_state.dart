part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSucces extends LoginState {
  final bool status;

  const LoginSucces(this.status);

  @override
  List<Object> get props => [status];
}

final class LoginFailed extends LoginState {
  final String message;

  const LoginFailed(this.message);

  @override
  List<Object> get props => [message];
}
