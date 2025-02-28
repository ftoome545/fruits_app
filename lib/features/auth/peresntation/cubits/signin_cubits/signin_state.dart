part of 'signin_cubit.dart';

@immutable
sealed class SigninCubitsState {}

final class SigninInitial extends SigninCubitsState {}

final class SigninLoading extends SigninCubitsState {}

final class SigninSuccess extends SigninCubitsState {
  final UserEntity userEntity;

  SigninSuccess({required this.userEntity});
}

final class SigninFailure extends SigninCubitsState {
  final String message;

  SigninFailure({required this.message});
}
