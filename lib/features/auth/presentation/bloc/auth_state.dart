part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}
final class AuthLoaing extends AuthState {}
final class AuthSuccess extends AuthState {
  final User user;
  const AuthSuccess(this.user);
}
final class AuthFailure extends AuthState {
  final String message;

  const AuthFailure({required this.message});

}
