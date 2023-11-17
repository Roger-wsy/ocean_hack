part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthError extends AuthState {
  final String message;

  const AuthError({this.message = 'Something went wrong'});

  @override
  List<Object> get props => [message];
}

class AuthLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final AuthUser user;

  const AuthLoginSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthLogoutSuccess extends AuthState {}
