part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}



final class AuthCreateUserIdLoading extends AuthState {}
final class AuthCreateUserIdSuccess extends AuthState {}
final class AuthCreateUserIdFailure extends AuthState {
  final String message;

  AuthCreateUserIdFailure(this.message);
}


final class AuthUserIdExistLoading extends AuthState {}
final class AuthUserIdExistSuccess extends AuthState {}
final class AuthUserIdExistFailure extends AuthState {
  final String message;

  AuthUserIdExistFailure(this.message);
}
